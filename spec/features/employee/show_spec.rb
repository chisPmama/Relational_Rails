require 'rails_helper'

RSpec.describe 'Employee' do
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

  it 'can go to a specific employee page by id and return their attributes' do
    visit "/employees/#{@eli.id}"
    expect(page).to have_content(@eli.name)
    expect(page).to have_content(@eli.position)
    expect(page).to have_content(@eli.active)
    expect(page).to have_content(@eli.hired_date)
    expect(page).to have_content("$0.00")
    expect(page).to have_content(@eli.salary)
  end

  it 'has a link that returns back to the Employee Index' do
    visit "/employees/#{@eli.id}"
    expect(page).to have_content("Eli")
    click_link "Back to Employee Index"
    expect(current_path).to eq("/employees")
    expect(page).to have_content("Employees")
  end
  
end