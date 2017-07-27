class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.integer :category, default: Vehicle::Categories[:one]
      t.string :color
      t.string :year
      t.integer :status, default: Vehicle::Status[:active]

      t.timestamps null: false
    end
  end
end
