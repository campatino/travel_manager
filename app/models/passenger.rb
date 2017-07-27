class Passenger < ActiveRecord::Base
    has_many :routes

    validates :name, presence: true

    Status = {active: 1, inactive: 0}

    def status_to_s
        if self.status == Status[:active]
            "Active"
        elsif self.status == Status[:inactive]
            "Inactive"
        end
    end

    def self.get_active
        where.not(status: Status[:inactive])
    end

    def self.for_selectable
        Passenger.get_active.order("name").map { |p| [p.name, p.id] }
    end

    def self.status_for_selectable
    	[["Active", 1],["Inactive", 0]]
    end
end
