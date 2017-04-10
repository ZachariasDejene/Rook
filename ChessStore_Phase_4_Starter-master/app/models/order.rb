class Order < ActiveRecord::Base

    require 'base64'

    before_create :order_date_not_specified
    before_destroy :can_be_destroyed?

    # Relationships
    has_many :order_items
    has_many :items, through: :order_items
    belongs_to :user
    belongs_to :school

    # Attributes
    attr_accessor :credit_card_number
    attr_accessor :expiration_year
    attr_accessor :expiration_month
    attr_reader :canDestroy

    # Scopes
    scope :chronological, -> { order(date: :desc) }
    scope :paid, -> { where.not(payment_receipt: nil) }
    scope :for_school, ->(school_id) { where(school_id: school_id) }

    # Validations
    # validates_date :date  # not essential, but permittable
    validates_numericality_of :grand_total, greater_than_or_equal_to: 0, allow_blank: true

   #Class Method
    def self.not_shipped
        Order.joins(:order_items).where("order_items.shipped_on IS NULL").distinct
    end

    #Methods
    def pay
        if !self.payment_receipt.nil?
            return false 
        end
        create_receipt
        self.save!
        self.payment_receipt
    end

    def total_weight
        weight = self.order_items.inject(0){|sum, n| sum += n.item.weight * n.quantity}
    end

    def shipping_costs
        shipping_costs(self.total_weight, base=5.00)
    end

    def credit_card_type
        credit_card.type.nil? ? "N/A" : credit_card.type.name
    end


    private

    def order_date_not_specified
        if self.date.nil? 
            self.date = Date.current
        end
    end

    def user_is_active_in_system
        all_active_users = User.active.all.map(&:id)
        unless all_active_users.include?(self.user_id)
        errors.add(:user_id, "is not an active user at the chess store")
        end
    end
    
    def school_is_active_in_system
        all_active_schools = School.active.all.map(&:id)
        unless all_active_schools.include?(self.school_id)
        errors.add(:school_id, "is not an active school at the chess store")
        end
    end

    def create_receipt
        self.payment_receipt = Base64.encode64("order: #{self.id}; amount_paid: #{self.grand_total}; received: #{self.date}; card: #{self.credit_card_type} ****#{self.credit_card_number[-4..-1]}")
    end

    def can_be_destroyed?
        @canDestroy = self.orders.empty? 
        remove_unshipped_items
        return @canDestroy
    end

    def remove_unshipped_items
        if !canDestroy.nil?
            self.order_items.unshipped.each{ |n| n.destroy } 
        end
    end

      def credit_card
    CreditCard.new(self.credit_card_number, self.expiration_year, self.expiration_month)
  end

  def credit_card_number_is_valid
    return false if self.expiration_year.nil? || self.expiration_month.nil?
    if self.credit_card_number.nil? || credit_card.type.nil?
      errors.add(:credit_card_number, "is not valid")
      return false
    end
    true
  end

  def expiration_date_is_valid
    return false if self.credit_card_number.nil? 
    if self.expiration_year.nil? || self.expiration_month.nil? || credit_card.expired?
      errors.add(:expiration_year, "is expired")
      return false
    end
    true
  end

    def shipping_costs(weight, base=5.00)
      additional = shipping_increment(weight)
      cost = base + additional
    end

    def shipping_increment(total_weight, allowed=3, charge=0.25)
      if total_weight <= allowed
          return 0 
      end
      plus = (total_weight - allowed).to_i
      additional = plus * charge
    end  

end