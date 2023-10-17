require "rails_helper"


RSpec.describe "the employee edit from show page" do
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
    end

  it "can edit the employee" do
    @bjorn = @maisonmargaux.employees.create(name: "Bjorn Nilsen", position: "FOH Floor Captain", active: true, hired_date: "20230515", hourly_wage: 18.50, salary: false)

    visit "/employees/#{@bjorn.id}"
    expect(page).to have_content("FOH Floor")
    click_link "Update Employee"
    fill_in "Name", with: "Bjorn Nilsen"
    fill_in "Position", with: "FOH General Manager"
    fill_in "Active", with: true
    fill_in "Hired date", with: "20230515"
    fill_in "Hourly wage", with: 0
    fill_in "Salary", with: true
    click_button "Update Employee"

    expect(current_path).to eq("/employees/#{@bjorn.id}")
    expect(page).to have_content("General Manager")
  end

    it 'can edit the employee entry from the Index' do
      visit '/employees'
      expect(page).to have_content("FOH Lead Server")
      click_link "Edit Anthea Yur"
      fill_in "Name", with: "Anthea Yur"
      fill_in "Position", with: "FOH Lead Server and Training Coordinator"
      fill_in "Active", with: true
      fill_in "Hired date", with: "20230715"
      fill_in "Hourly wage", with: 18.50
      fill_in "Salary", with: false
      click_button "Update Employee"

      expect(current_path).to eq("/employees/#{@anthea.id}")
      expect(page).to have_content("Training Coordinator")
    end

    it 'can edit the Employee entry from the Restaurant Employee Index' do
      visit "/restaurants/#{@maisonmargaux.id}/employees"
      click_link "Edit Anthea Yur"
      fill_in "Name", with: "Anthea Yur"
      fill_in "Position", with: "FOH Lead Server and Training Coordinator"
      fill_in "Active", with: true
      fill_in "Hired date", with: "20230715"
      fill_in "Hourly wage", with: 18.50
      fill_in "Salary", with: false
      click_button "Update Employee"

      expect(current_path).to eq("/employees/#{@anthea.id}")
      expect(page).to have_content("Training Coordinator")

    end
  

end