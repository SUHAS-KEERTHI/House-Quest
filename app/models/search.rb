class Search < ApplicationRecord
    
    def search_houses
        houses = House.all
        
        houses = houses.where(["location LIKE  ?","%#{location}%"]) if location.present?
        houses = houses.where(["listprice >= ?", min_price]) if min_price.present?
        houses = houses.where(["listprice <= ?", max_price]) if max_price.present?
        houses = houses.where(["squareft >= ?", min_squarefoot]) if min_squarefoot.present?
        houses = houses.where(["squareft >= ?", min_squarefoot]) if min_squarefoot.present?
        
        return houses
        
    end
end
