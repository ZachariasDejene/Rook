class School < ActiveRecord::Base

    before_destroy :can_be_destroyed?
    after_rollback :make_inactive
    #Relationships
    has_many :orders
    has_many :users, through: :orders 

    attr_reader :canDestroy

    STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]

    #Scopes
    scope :alphabetical,  -> { order(:name) }
    scope :active,  -> { where(active: true) }
    scope :inactive,  -> { where(active: false) }

    #Validations
    validates_presence_of :name, :street_1, :zip
    validate :school_is_unique, on: :create
    validates_inclusion_of :state, in: STATES_LIST.map{|k, v| v}, message: "isn't a valid State"
    validates_format_of :zip, with: /\A\d{5}\z/, message: "zip must be 5 digits"

    private

    def can_be_destroyed?
        @canDestroy = self.orders.empty? 
    end

    def make_inactive
        if @canDestroy == false && !@canDestroy.nil?
            self.update_attribute(:active, false)
        end
        @canDestroy = nil
    end

    def school_is_unique
        if self.name.nil? || self.street_1.nil? || self.zip.nil?
            return true
        elsif !School.where(name: self.name, zip: self.zip).empty?
            errors.add(:name, "already exists")
        end
    end


end
