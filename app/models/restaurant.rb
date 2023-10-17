require 'date'

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
 
  # def testwoh
  #   binding.pry
  # end

  def salary_employees
    self.employees.where("salary=true")
  end

  def insured_employees
    insured_employees = salary_employees
    # insured_employees << self.employees.where("salary!=true").find_all{|employee| Date.today - employee.hired_date}
    ## how could you do the math for this? Research
  end

  def open_positions
    self.max_employee_quantity - employee_count
  end

  def FOH_employees
    # self.employees.where("title contains 'FOH'")
  end

  # "playlists.created_at >= '2020-01-01'"

  
end