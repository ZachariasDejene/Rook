class Item < ActiveRecord::Base
  # List of allowable categories
  CATEGORIES = [['Boards','boards'],['Pieces','pieces'],['Clocks','clocks'],['Supplies','supplies']]
  
  before_destroy :can_be_destroyed?
  after_destroy :remove_unshipped_items
  after_rollback :make_inactive

  # Relationships
  has_many :item_prices
  has_many :purchases
  has_many :order_items
  has_many :orders, through: :order_items

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }
  scope :for_category, ->(category) { where(category: category) }
  scope :for_color,    ->(color) { where("color like ?", "%#{color.downcase}%") }
  scope :need_reorder, ->{ where("reorder_level >= inventory_level") }
  
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates_numericality_of :weight, greater_than: 0
  validates_numericality_of :inventory_level, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :reorder_level, only_integer: true, greater_than_or_equal_to: 0
  validates_inclusion_of :category, in: CATEGORIES.map{|key, value| value}, message: "is not an option"
  # validates_inclusion_of :category, in: CATEGORIES.to_h.values, message: "is not an option"

  # Other methods
  def current_price
    curr = self.item_prices.wholesale.current.first
    if curr.nil?
      return nil
    else
      return curr.price
    end
  end

  def current_manufacturer_price
    curr = self.item_prices.manufacturer.current.first
    if curr.nil?
      return nil
    else
      return curr.price
    end
  end

  def price_on_date(date)
    data = self.item_prices.wholesale.for_date(date).first
    if data.nil?
      return nil
    else
      return data.price
    end
  end

  def manufacturer_price_on_date(date)
    data = self.item_prices.manufacturer.for_date(date).first
    if data.nil?
      return nil
    else
      return data.price
    end
  end

  def reorder?
    reorder_level >= inventory_level
  end

  private 

    def can_be_destroyed?
        @canDestroy = self.order_items.shipped.empty? 
    end

    def make_inactive
      if @canDestroy == false && !@canDestroy.nil?
        remove_unshipped_items
        self.update_attribute(:active, false)
      end
      @canDestroy = nil
    end

    def remove_unshipped_items
      self.order_items.unshipped.each{|n| n.destroy if n.order.payment_receipt.nil?}
    end

end

