class Vehicle < ActiveRecord::Base
    has_many :routes

    before_validation :upcase_plate, on: [:create, :update]
    before_validation :set_category, on: [:create, :update]    
    validate :company_plates
    validates :plate, presence: true, uniqueness: true
    validates :color, presence: true
    validates :year, presence: true

    Categories = {one: 0, two: 1}
    Status = {active: 1, inactive: 0}

    def status_to_s
        if self.status == Status[:active]
            "Active"
        elsif self.status == Status[:inactive]
            "Inactive"
        end
    end

    def company_plates
        errors.add(:plate, "should start with ABC or DFG") unless self.plate.start_with?("ABC", "DFG")
    end

    def upcase_plate
        self.plate = self.plate.upcase
    end

    def set_category
        self.category = self.plate.start_with?("ABC") ? Categories[:one] : Categories[:two]
    end

    def category_name
        return "1" if self.category == Categories[:one]
        return "2" if self.category == Categories[:two]
    end

    def self.get_active
        where.not(status: Status[:inactive])
    end

    def self.for_selectable
        Vehicle.get_active.order("plate").map { |e| [e.plate,e.id] }
    end

    def self.years_for_selectable
        (1970..DateTime.now.year).map{ |y| [y,y] }
    end

    def self.status_for_selectable
        [["Active", 1],["Inactive", 0]]
    end
end
