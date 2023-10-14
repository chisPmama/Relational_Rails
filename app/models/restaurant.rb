class Restaurant < ApplicationRecord
  has_many :employees
  
  validates_presence_of :name
  validates_presence_of :location 
  validates :offers_insurance, inclusion: [true, false]
  validates_presence_of :max_employee_quantity
  validates_presence_of :opening_date

  def employee_count
    self.employees.count
  end
  
end