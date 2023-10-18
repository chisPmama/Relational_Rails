class Employee < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of :name
  validates_presence_of :position 
  validates :active, inclusion: [true, false]
  validates_presence_of :hired_date
  validates_presence_of :hourly_wage
  validates :salary, inclusion: [true, false]

  def self.all_active
    where(active: :true)
  end
end
 