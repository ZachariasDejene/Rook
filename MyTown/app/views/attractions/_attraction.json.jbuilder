json.extract! attraction, :id, :name, :street, :town_id, :latitude, :longitude, :created_at, :updated_at
json.url attraction_url(attraction, format: :json)
