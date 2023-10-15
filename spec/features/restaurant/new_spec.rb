require "rails_helper"

RSpec.describe "the Restaurant creation" do
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

  it "links to the new page from the restaurants index" do
    visit "/restaurants"

    click_link("New Restaurant")
    expect(current_path).to eq("/restaurants/new")
  end

 it 'contains a link that can create a new restaurant record' do
    visit "/restaurants"
    expect(page).to have_content("Restaurants")
    click_link "New Restaurant"
    expect(current_path).to eq("/restaurants/new")
    fill_in "Name", with: "Artisans and Spice"
    fill_in "Location", with: "225 south 6th Street, Minneapolis MN, 55402"
    fill_in "Offers insurance", with: "true"
    fill_in "Max employee quantity", with: "4"
    fill_in "Opening date", with: "20221208"

    click_button "Create Restaurant"
    expect(current_path).to eq("/restaurants")
    save_and_open_page
    expect(page).to have_content("Artisans and Spice")
  end
end