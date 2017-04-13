class Attraction < ApplicationRecord

    #Relationships
    belongs_to :town
    
    #Scopes
    scope :alphabetical,  -> { order(:name) }

end
