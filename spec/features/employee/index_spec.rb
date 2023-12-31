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

    @abigail = @maisonmargaux.employees.create(name: "Abigail Landhuis", position: "FOH Server", active: false, hired_date: "20230515", hourly_wage: 14.50, salary: false)
    @morgan = @maisonmargaux.employees.create(name: "Morgan Hawley", position: "BOH Spirits Director", active: false, hired_date: "20230515", hourly_wage: 0, salary: true)
    @aldo = @fhimas.employees.create(name: "Aldo Hidalgo", position: "FOH General Manager", active: true, hired_date: "20180928", hourly_wage: 0, salary: true)
  end

  it 'shows all of the employees in the Employees table and returns their attributes' do
    visit "/employees"
    expect(page).to have_content(@employees)
  end

  it 'only returns the true records of active employees' do
    visit '/employees'
    expect(page).to_not have_content("Active: false")
  end

  it 'has a link after each employee with an option to edit' do
    visit "/employees"
    expect(page).to have_content("Edit Eli Fhima")
    expect(page).to have_content("Edit David Fhima")
    expect(page).to have_content("Edit Anthea Yur")
    click_link "Edit Anthea Yur"
    expect(current_path).to eq("/employees/#{@anthea.id}/edit")
  end

  it 'has a link that can delete an employee from index' do
    @frankie = @maisonmargaux.employees.create(name: "Frankie Stephenson", position: "FOH Server", active: true, hired_date: "20230624", hourly_wage: 14.50, salary: false)
    visit "/employees"
    click_link "Delete Frankie Stephenson"
    expect(current_path).to eq("/employees")
    expect(page).to_not have_content("Frankie")
  end
end
