require 'spec_helper'

feature "editing a lab" do

  scenario "with valid credentials" do
    lab = create(:lab, name: 'BCN')
    visit lab_path(lab)
    click_link "Edit Lab"
    fill_in "Name", with: "BCN2"
    click_button "Update Lab"
    expect(page).to have_content("updated")
  end

end