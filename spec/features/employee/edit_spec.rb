require "rails_helper"


RSpec.describe "the employee edit from show page" do

  it "can edit the employee" do
    @maisonmargaux = Restaurant.create(name: 'Maison Margaux', 
    location: '224 N 1st St, Minneapolis, MN 55401',
    offers_insurance: true,
    max_employee_quantity: 20,
    opening_date: 20230515)
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

end