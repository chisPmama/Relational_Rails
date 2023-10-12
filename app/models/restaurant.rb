class Restaurant < ApplicationRecord
  has_many :employees
  
  validates_presence_of :name
  validates_presence_of :location 
  validates_presence_of :offers_insurance
  validates_presence_of :max_employee_quantity
  validates_presence_of :opening_date

end