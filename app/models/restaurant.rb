require 'date'

class Restaurant < ApplicationRecord
  has_many :employees
  
  validates_presence_of :name
  validates_presence_of :location 
  validates :offers_insurance, inclusion: [true, false]
  validates_presence_of :max_employee_quantity
  validates_presence_of :opening_date

  def employee_count
    employees.count
  end

  def salary_employees
    employees.where("salary=true")
  end

  def open_positions
    max_employee_quantity - employee_count
  end

  def alphabetical
    employees.order("name ASC")
  end

  def insured_employees
    insured_employees = salary_employees
    # insured_employees << self.employees.where("salary!=true").find_all{|employee| Date.today - employee.hired_date}
    ## how could you do the math for this? Research
  end
  
end