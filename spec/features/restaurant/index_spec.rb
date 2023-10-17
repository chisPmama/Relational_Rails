require 'rails_helper'

RSpec.describe 'Restaurant' do
  before :each do
    @maisonmargaux = Restaurant.create!(name: 'Maison Margaux', 
                                       location: '224 N 1st St, Minneapolis, MN 55401',
                                       offers_insurance: true,
                                       max_employee_quantity: 20,
                                       opening_date: 20230515)
    @eli = @maisonmargaux.employees.create(name: "Eli Fhima", position: "FOH Maitre D", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @david = @maisonmargaux.employees.create(name: "David Fhima", position: "BOH Head Chef", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @anthea = @maisonmargaux.employees.create(name: "Anthea Yur", position: "FOH Lead Server", active: true, hired_date: "20230715", hourly_wage: 18.50, salary: false)
    @bjorn = @maisonmargaux.employees.create(name: "Bjorn Nilsen", position: "FOH General Manager", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
    @margo = @maisonmargaux.employees.create(name: "Margo Potts", position: "FOH Host", active: true, hired_date: "20230908", hourly_wage: 15.00, salary: false)

    @fhimas = Restaurant.create!(name: 'Fhimas', 
                                location: '40 S 7th St, Minneapolis, MN 55402',
                                offers_insurance: true,
                                max_employee_quantity: 12,
                                opening_date: 20180928)

    @motherdough = Restaurant.create!(name: 'Mother Dough', 
                                    location: '1st floor fireside lounge, 225 South 6th St, Minneapolis, MN 55402',
                                    offers_insurance: false,
                                    max_employee_quantity: 5,
                                    opening_date: 20230624)
  end

  it 'returns the names of each restaurant in the index' do
    visit "/restaurants"

    expect(page).to have_content(@maisonmargaux.name)
    expect(page).to have_content(@fhimas.name)
    expect(page).to have_content(@motherdough.name)
  end

  it 'returns the names of each restaurant in the order of which created' do
    visit "/restaurants"

    expect(@motherdough.name).to appear_before(@fhimas.name)
    expect(@fhimas.name).to appear_before(@maisonmargaux.name)
    expect(page).to have_content(@maisonmargaux.name)
    expect(page).to have_content(@fhimas.name)
    expect(page).to have_content(@motherdough.name)
    expect(page).to have_content(@maisonmargaux.created_at)
    expect(page).to have_content(@fhimas.created_at)
    expect(page).to have_content(@motherdough.created_at)
  end

  it 'has a link after each restaurant with an option to edit' do
    visit "/restaurants"
    expect(page).to have_content("Edit Maison Margaux")
    expect(page).to have_content("Edit Fhimas")
    expect(page).to have_content("Edit Mother Dough")
    click_link "Edit Maison Margaux"
    expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/edit")
  end

  it 'has a link to delete a restaurant after each restaurant record' do
    visit "/restaurants"
    expect(page).to have_content("Delete Maison Margaux")
    expect(page).to have_content("Delete Fhimas")
    expect(page).to have_content("Delete Mother Dough")
    click_link "Delete Mother Dough"
    expect(current_path).to eq("/restaurants")
    expect(page).to_not have_content("Mother Dough")
  end

end