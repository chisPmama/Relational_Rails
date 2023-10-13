require 'rails_helper'

RSpec.describe Restaurant do
  describe 'relationship' do
    it {should have_many :employees}
  end

  describe 'validations' do
  it {should validate_presence_of :name}
  it {should validate_presence_of :location}
  it {should validate_presence_of :offers_insurance}
  it {should validate_presence_of :max_employee_quantity}
  it {should validate_presence_of :opening_date}
  end

end