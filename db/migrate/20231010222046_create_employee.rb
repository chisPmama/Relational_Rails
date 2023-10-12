class CreateEmployee < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.boolean :active
      t.datetime :hired_date
      t.float :hourly_wage
      t.boolean :salary

      t.timestamps
    end
  end
end