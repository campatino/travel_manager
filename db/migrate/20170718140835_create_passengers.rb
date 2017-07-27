class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.integer :status, default: Passenger::Status[:active]
      t.string :cellphone

      t.timestamps null: false
    end
  end
end
