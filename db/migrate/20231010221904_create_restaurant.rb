class CreateRestaurant < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.boolean :offers_insurance
      t.integer :max_employee_quantity
      t.string :opening_date

      t.timestamps
    end
  end
end