class AddRestaurantToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :restaurant, null: false, foreign_key: true
  end
end
