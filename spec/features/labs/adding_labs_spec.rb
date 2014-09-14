require 'rails_helper'

feature "adding a lab" do

  skip "as a guest"

  scenario "with valid credentials" do
    login
    visit root_path
    click_link "Labs"
    click_link "Add a Lab"
    fill_in "Name", with: "NASA"
    fill_in "Description", with: "Space Lab"
    click_button "Add Lab"
    expect(page).to have_content("Thanks")
  end

  scenario "without valid credentials" do
    login
    visit new_lab_path
    fill_in "Name", with: "NASA"
    click_button "Add Lab"
    expect(page).to have_content("invalid")
  end

end
