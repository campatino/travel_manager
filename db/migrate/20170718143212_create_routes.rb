class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :start_point
      t.string :end_point
      t.references :vehicle, index: true, foreign_key: true
      t.references :passenger, index: true, foreign_key: true
      t.integer :status, default: Route::Status[:active]

      t.timestamps null: false
    end
  end
end
