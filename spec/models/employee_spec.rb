require 'rails_helper'

RSpec.describe Employee do
  describe 'relationship' do
    it {should belong_to :restaurant}
  end

  describe 'validations' do
  it {should validate_presence_of :name}
  it {should validate_presence_of :position}
  it { should allow_value(true).for(:active) }
  it { should allow_value(false).for(:active) }
  it {should validate_presence_of :hired_date}
  it {should validate_presence_of :hourly_wage}
  it { should allow_value(true).for(:salary) }
  it { should allow_value(false).for(:salary) }
  end

  

end