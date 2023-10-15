require "rails_helper"

RSpec.describe "the restaurant edit from show page" do
  it "links to the edit page" do
    artisansspice = Restaurant.create!(name: "Artisans and Spice", location: "225 south 6th Street, Minneapolis MN, 55402", offers_insurance: true, max_employee_quantity: 4, opening_date: 20221208)
    visit "/restaurants/#{artisansspice.id}"
    click_link "Update Artisans and Spice"

    expect(current_path).to eq("/restaurants/#{artisansspice.id}/edit")
  end

  it "can edit the restaurant" do
    artisansspice = Restaurant.create!(name: "Artisans and Spice", location: "225 south 6th Street, Minneapolis MN, 55402", offers_insurance: true, max_employee_quantity: 4, opening_date: 20221208)
    visit "/restaurants/#{artisansspice.id}"
    expect(page).to have_content("Artisans")
    click_link "Update Artisans and Spice"
    fill_in "Name", with: "Artisans & Spice"
    fill_in "Location", with: "225 south 6th Street, Minneapolis MN, 55402"
    fill_in "Offers insurance", with: true
    fill_in "Max employee quantity", with: 4
    fill_in "Opening date", with: 20221208

    click_button "Update Restaurant"

    expect(current_path).to eq("/restaurants/#{artisansspice.id}")
    expect(page).to have_content("&")
  end

end
