class Wine < ApplicationRecord
    has_many :meal_plan_wines
    has_many :meal_plan, through: :meal_plan_wines

    def self.varietals
        varietals_array = Wine.all.map do |wine|
            wine.varietal
        end.uniq
        varietals_array << "All"
    end

    def self.by_varietal(varietal)
        Wine.all.select do |wine|
            wine.varietal == varietal
        end
    end

    def self.count_of_varietal(varietal)
        self.by_varietal(varietal).count
    end

    def found_in_title?(search)
        self.title.downcase.include?(search.downcase)
    end

    def self.prices
        ["Under $10", "$10 - $25", "$25 - $50", "Above $50"]
    end

    def price_to_number
        self.price.gsub(/\$/, '').to_f
    end

    def self.price_range(min, max)
        Wine.all.select do |wine|
            wine.price_to_number < max && wine.price_to_number >= min
        end
    end

    def self.by_price(price)
        case price
        when "Under $10"
            Wine.price_range(0, 10)
        when "$10 - $25"
            Wine.price_range(10, 25)
        when "$25 - $50"
            Wine.price_range(25, 50)
        when "Above $50"
            Wine.price_range(50, 1000)
        end
    end

    def self.by_search(search)
        Wine.all.select do |wine|
            wine.found_in_title?(search)
        end
    end

    def self.titles
        Wine.all.map do |wine|
            wine.title
        end
    end

end
