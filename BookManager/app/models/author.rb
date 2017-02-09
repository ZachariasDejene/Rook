class Author < ApplicationRecord

    #Relationships
    #----------------------
    has_many :book_authors
    has_many :books, through: :book_authors

    #Scopes
    #----------------------
    scope :alphabetical, -> { order('last_name, first_name') }

    #Validations
    #----------------------
    validates_presence_of :first_name, :last_name

    #Functions
    #----------------------
    def name
        "#{last_name}, #{first_name}"
    end
    

end
