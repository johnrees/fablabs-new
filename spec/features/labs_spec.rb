require 'spec_helper'

feature "adding a lab" do

  scenario "with valid credentials" do
    visit root_path
    click_link "Labs"
    click_link "Add a Lab"
    fill_in "Name", with: "NASA"
    fill_in "Description", with: "Space Lab"
    click_button "Add Lab"
    expect(page).to have_content("Thanks")
  end

  scenario "without valid credentials" do
    visit new_lab_path
    fill_in "Name", with: "NASA"
    click_button "Add Lab"
    expect(page).to have_content("invalid")
  end

end

feature "editing a lab" do

  scenario "with valid credentials" do
    lab = FactoryGirl.create(:lab, name: 'BCN')
    visit lab_path(lab)
    click_link "Edit Lab"
    fill_in "Name", with: "BCN2"
    click_button "Update Lab"
    expect(page).to have_content("updated")
  end

end

feature "viewing a lab" do

  scenario "profile page" do
    # FactoryGirl.create(:lab, name: "NASA")
    visit labs_path
    click_link "NASA"
    expect(page).to have_title("NASA")
  end

end
