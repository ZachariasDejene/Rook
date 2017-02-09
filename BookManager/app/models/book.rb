class Book < ApplicationRecord

    #Relationships
    #----------------------
    belongs_to :publisher                     
    has_many :book_authors
    has_many :authors, through: :book_authors              

    #Scopes
    #----------------------
    scope :alphabetical, -> { order('title') }
    scope :last_decade, -> { where('year_published > ?', 2007) }


    #Validations
    #----------------------
    validates_presence_of :title                        
    validates :some_column, :numericality => {:only_integer => true}


end
