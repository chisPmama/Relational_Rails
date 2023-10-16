require 'rails_helper'

RSpec.describe 'Restaurant' do
  before :each do
    @maisonmargaux = Restaurant.create(name: 'Maison Margaux', 
                                       location: '224 N 1st St, Minneapolis, MN 55401',
                                       offers_insurance: true,
                                       max_employee_quantity: 20,
                                       opening_date: 20230515)
    @eli = @maisonmargaux.employees.create(name: "Eli Fhima", position: "FOH Maitre D", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @david = @maisonmargaux.employees.create(name: "David Fhima", position: "BOH Head Chef", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @anthea = @maisonmargaux.employees.create(name: "Anthea Yur", position: "FOH Lead Server", active: true, hired_date: "20230715", hourly_wage: 18.50, salary: false)
    @bjorn = @maisonmargaux.employees.create(name: "Bjorn Nilsen", position: "FOH General Manager", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @margo = @maisonmargaux.employees.create(name: "Margo Potts", position: "FOH Host", active: true, hired_date: "20230908", hourly_wage: 15.00, salary: false)

    @fhimas = Restaurant.create(name: 'Fhimas', 
                                location: '40 S 7th St, Minneapolis, MN 55402',
                                offers_insurance: true,
                                max_employee_quantity: 12,
                                opening_date: 20180928)
  end

  it 'shows all of the employees in the Employees table and returns their attributes' do
    visit "/employees"

    expect(page).to have_content(@employees)
  end
end