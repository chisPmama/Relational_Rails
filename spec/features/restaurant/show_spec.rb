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

    @motherdough = Restaurant.create(name: 'Mother Dough', 
                                    location: '1st floor fireside lounge, 225 South 6th St, Minneapolis, MN 55402',
                                    offers_insurance: false,
                                    max_employee_quantity: 5,
                                    opening_date: 20230624)
        
    @aldo = @fhimas.employees.create(name: "Aldo Hidalgo", position: "FOH General Manager", active: true, hired_date: "20180928", hourly_wage: 0, salary: true)    
    @frankie = @motherdough.employees.create(name: "Frankie Stephenson", position: "FOH Cashier", active: true, hired_date: "20230624", hourly_wage: 14.50, salary: false)
  end

  it 'can go to a restaurant page by id and return its attributes' do
    visit "/restaurants/#{@maisonmargaux.id}"

    expect(page).to have_content(@maisonmargaux.name)
    expect(page).to have_content(@maisonmargaux.location)
    expect(page).to have_content(@maisonmargaux.offers_insurance)
    expect(page).to have_content(@maisonmargaux.max_employee_quantity)
    expect(page).to have_content(@maisonmargaux.opening_date)
  end

  it 'returns the names of each restaurant in the order of which created' do
    visit "/restaurants/#{@maisonmargaux.id}"
    expect(page).to have_content(@maisonmargaux.employees.count)
    expect(@maisonmargaux.employees.count).to eq(5)
    visit "/restaurants/#{@fhimas.id}"
    expect(page).to have_content(@fhimas.employees.count)
    expect(@fhimas.employees.count).to eq(1)
    visit "/restaurants/#{@motherdough.id}"
    expect(page).to have_content(@motherdough.employees.count)
    expect(@motherdough.employees.count).to eq(1)
  end

  it 'has a link that returns back to the Restaurant Index' do
    visit "/restaurants/#{@motherdough.id}"
    expect(page).to have_content("Mother Dough")
    click_link "Back to Restaurant Index"
    expect(current_path).to eq("/restaurants")
    expect(page).to have_content("Restaurant")
  end

  it 'can return the number of employees per each restaurant' do
    visit "/restaurants/#{@motherdough.id}"
    expect(page).to have_content("Employee Count")
  end

  it 'has a link that goes to the employees list of that restaurant' do
    visit "/restaurants/#{@maisonmargaux.id}"
    expect(page).to have_content("Maison Margaux")
    click_link "Go to Employees List"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/employees")
    expect(page).to have_content("Eli")
  end

  it 'has a button that goes to edit the current restaurant' do
    visit "/restaurants/#{@maisonmargaux.id}"
    expect(page).to have_content("Maison Margaux")
    click_button "Update Maison Margaux"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/edit")
  end

  it 'has a link to delete a restaurant' do
    visit "/restaurants/#{@motherdough.id}"
    click_link "Delete Mother Dough"
    expect(current_path).to eq("/restaurants")
    expect(page).to_not have_content("Mother Dough")
  end

end