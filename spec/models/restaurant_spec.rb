require 'rails_helper'

RSpec.describe Restaurant do
  before :each do
    @maisonmargaux = Restaurant.create(name: 'Maison Margaux', 
                                  location: '224 N 1st St, Minneapolis, MN 55401',
                                  offers_insurance: true,
                                  max_employee_quantity: 20,
                                  opening_date: 20230515)

    @fhimas = Restaurant.create(name: 'Fhimas', 
                            location: '40 S 7th St, Minneapolis, MN 55402',
                            offers_insurance: true,
                            max_employee_quantity: 12,
                            opening_date: 20180928)

    @motherdough = Restaurant.create(name: 'Mother Dough', 
                            location: '1st floor fireside lounge, 225 South 6th St, Minneapolis, MN 55402',
                            offers_insurance: false,
                            max_employee_quantity: 5,
                            opening_date: 20230624)

    @eli = @maisonmargaux.employees.create(name: "Eli Fhima", position: "FOH Maitre D", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @david = @maisonmargaux.employees.create(name: "David Fhima", position: "BOH Head Chef", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @anthea = @maisonmargaux.employees.create(name: "Anthea Yur", position: "FOH Lead Server", active: true, hired_date: "20230715", hourly_wage: 18.50, salary: false)
    @bjorn = @maisonmargaux.employees.create(name: "Bjorn Nilsen", position: "FOH General Manager", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @margo = @maisonmargaux.employees.create(name: "Margo Potts", position: "FOH Host", active: true, hired_date: "20230908", hourly_wage: 15.00, salary: false)
    @aldo = @fhimas.employees.create(name: "Aldo Hidalgo", position: "FOH General Manager", active: true, hired_date: "20180928", hourly_wage: 0, salary: true)
  end
  describe 'relationship' do
    it {should have_many :employees}
  end

  describe 'validations' do
  it {should validate_presence_of :name}
  it {should validate_presence_of :location}
  it { should allow_value(true).for(:offers_insurance) }
  it { should allow_value(false).for(:offers_insurance) }
  it {should validate_presence_of :max_employee_quantity}
  it {should validate_presence_of :opening_date}
  end

  describe 'employee_count' do
    it "will return the number of employees" do
      expect(@maisonmargaux.employee_count).to eq(5)
      expect(@fhimas.employee_count).to eq(1)
      expect(@motherdough.employee_count).to eq(0)
    end
  end
end