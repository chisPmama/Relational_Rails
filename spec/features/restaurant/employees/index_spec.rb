require 'rails_helper'

RSpec.describe 'Restaurant_Employees' do
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
    @aldo = @fhimas.employees.create(name: "Aldo Hidalgo", position: "FOH General Manager", active: true, hired_date: "20180928", hourly_wage: 0, salary: true)

  end

  it 'can go to a specific restaurant and return its employees and attributes' do
    visit "/restaurants/#{@maisonmargaux.id}/employees"
    # save_and_open_page

    expect(page).to have_content(@maisonmargaux.name)
    expect(page).to have_content(@eli.name)
    expect(page).to have_content(@eli.position)
    expect(page).to have_content(@eli.active)
    expect(page).to have_content(@eli.hired_date)
    expect(page).to have_content("$0.00")
    expect(page).to have_content(@eli.salary)
    expect(page).to have_content(@david.name)
    expect(page).to have_content(@anthea.name)
    expect(page).to have_content(@bjorn.name)
    expect(page).to have_content(@margo.name)
  end

  it 'does not include Fhimas employees' do
    visit "/restaurants/#{@maisonmargaux.id}/employees"
    # save_and_open_page
    expect(page).to_not have_content(@aldo.name)
  end

  it 'has a link to create a new employee' do
    visit "/restaurants/#{@maisonmargaux.id}/employees"
    click_link "Add a New Employee"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/employees/new")
  end

  it "sorts the employees by alphabetical order of name" do
    visit "/restaurants/#{@maisonmargaux.id}/employees"
    expect(@eli.name).to appear_before(@david.name)
    click_link "Sort by Alphabetical Order"
    # expect(page).to eq("/restaurants/#{@maisonmargaux.id}/employees")
    save_and_open_page

    expect(@anthea.name).to appear_before(@bjorn.name)
    expect(@bjorn.name).to appear_before(@david.name)
    expect(@david.name).to appear_before(@eli.name)
    expect(@eli.name).to appear_before(@margo.name)
  end

end