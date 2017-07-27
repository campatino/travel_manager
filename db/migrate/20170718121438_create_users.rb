class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :status, default: User::Status[:active]
      t.integer :role, default: User::Roles[:admin]

      t.timestamps null: false
    end
  end
end
