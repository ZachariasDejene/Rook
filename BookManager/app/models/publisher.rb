class Publisher < ApplicationRecord

        #Relationships
    #----------------------
    has_many :books              

    #Scopes
    #----------------------
    scope :alphabetical, -> { order('name') }

    #Validations
    #----------------------
    validates_presence_of :name

end
