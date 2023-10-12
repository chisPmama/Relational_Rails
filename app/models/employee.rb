class Employee < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of :name
  validates_presence_of :position 
  validates_presence_of :active
  validates_presence_of :hired_date
  validates_presence_of :hourly_wage
  validates_presence_of :salary

  
end
