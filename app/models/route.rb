class Route < ActiveRecord::Base
    belongs_to :vehicle
    belongs_to :passenger

    validates :start_point, presence: true
    validates :end_point, presence: true
    validates :vehicle_id, presence: true
    validates :passenger_id, presence: true
    
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

    def self.status_for_selectable
        [["Active", 1],["Inactive", 0]]
    end

end
