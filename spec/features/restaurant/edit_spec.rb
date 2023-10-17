require "rails_helper"

RSpec.describe "the restaurant edit from show page" do
  it "links to the edit page" do
    artisansspice = Restaurant.create!(name: "Artisans and Spice", location: "225 south 6th Street, Minneapolis MN, 55402", offers_insurance: true, max_employee_quantity: 4, opening_date: 20221208)
    visit "/restaurants/#{artisansspice.id}"
    click_button "Update Artisans and Spice"

    expect(current_path).to eq("/restaurants/#{artisansspice.id}/edit")
  end

  it "can edit the restaurant" do
    artisansspice = Restaurant.create!(name: "Artisans and Spice", location: "225 south 6th Street, Minneapolis MN, 55402", offers_insurance: true, max_employee_quantity: 4, opening_date: 20221208)
    visit "/restaurants/#{artisansspice.id}"
    expect(page).to have_content("Artisans")
    click_button "Update Artisans and Spice"
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

RSpec.describe "the restaurant edit from index page" do
  before(:each) do
    @maisonmargaux = Restaurant.create!(name: 'Maison Margaux', 
                                        location: '224 N 1st St, Minneapolis, MN 55401',
                                        offers_insurance: true,
                                        max_employee_quantity: 20,
                                        opening_date: 20230515)

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

  describe 'can edit the Restaurant entry' do
    it 'can edit the Restaurant entry from the Index' do
      visit '/restaurants'
      click_link "Edit Maison Margaux"
      expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}/edit")
      fill_in "Name", with: "Maison Margaux"
      fill_in "Location", with: "224 N 1st St, Minneapolis, MN 55401"
      fill_in "Offers insurance", with: true
      fill_in "Max employee quantity", with: 12
      fill_in "Opening date", with: 20230515
      click_button "Update Restaurant"

      expect(current_path).to eq("/restaurants/#{@maisonmargaux.id}")
      expect(page).to have_content("12")

    end
  end
end
