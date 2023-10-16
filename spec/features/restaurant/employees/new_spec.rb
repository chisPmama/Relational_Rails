require "rails_helper"

RSpec.describe '#the Employee creation' do
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
    @eli = @maisonmargaux.employees.create(name: "Eli Fhima", position: "FOH Maitre D", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @david = @maisonmargaux.employees.create(name: "David Fhima", position: "BOH Head Chef", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @anthea = @maisonmargaux.employees.create(name: "Anthea Yur", position: "FOH Lead Server", active: true, hired_date: "20230715", hourly_wage: 18.50, salary: false)
    @bjorn = @maisonmargaux.employees.create(name: "Bjorn Nilsen", position: "FOH General Manager", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @margo = @maisonmargaux.employees.create(name: "Margo Potts", position: "FOH Host", active: true, hired_date: "20230908", hourly_wage: 15.00, salary: false)
    @aldo = @fhimas.employees.create(name: "Aldo Hidalgo", position: "FOH General Manager", active: true, hired_date: "20180928", hourly_wage: 0, salary: true)
  end

  it 'has a link to create a new employee' do
    visit "/restaurants/#{@maisonmargaux.id}/employees"
    click_link "Add a New Employee"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/employees/new")
  end

  it 'can create a new employee record' do
    visit "/restaurants/#{@maisonmargaux.id}/employees"
    click_link "Add a New Employee"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/employees/new")
    fill_in "Name", with: "William Robinson"
    fill_in "Position", with: "FOH Server"
    fill_in "Active", with: true
    fill_in "Hired date", with: "20200815"
    fill_in "Hourly wage", with: 15.50
    fill_in "Salary", with: false

    click_button "Create Employee"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/employees")
    expect(page).to have_content("William Robinson")
    # save_and_open_page
  end
end