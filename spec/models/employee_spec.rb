require 'rails_helper'

RSpec.describe Employee do
  describe 'relationship' do
    it {should belong_to :restaurant}
  end

  describe 'validations' do
  it {should validate_presence_of :name}
  it {should validate_presence_of :position}
  it {should validate_presence_of :active}
  it {should validate_presence_of :hired_date}
  it {should validate_presence_of :hourly_wage}
  it {should validate_presence_of :salary}
  end

  

end