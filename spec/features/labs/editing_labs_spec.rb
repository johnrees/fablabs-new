require 'rails_helper'

feature "editing a lab" do

  scenario "as a guest" do
    lab = create(:lab)
    expect{ visit edit_lab_path(lab) }.to raise_error
    # expect(page).to have_content('please login')
  end

  scenario "as an authorised user, with valid credentials" do
    user = create(:user)
    lab = create(:lab, name: 'BCN', creator: user)
    login user
    visit lab_path(lab)
    click_link "Edit Lab"
    fill_in "Name", with: "BCN2"
    click_button "Update Lab"
    expect(page).to have_content("Lab updated")
  end

  scenario "as an authorised user, with invalid credentials" do
    user = create(:user)
    lab = create(:lab, name: 'BCN', creator: user)
    login user
    visit lab_path(lab)
    click_link "Edit Lab"
    fill_in "Name", with: nil
    click_button "Update Lab"
    expect(page).to have_content("can't be blank")
  end

  scenario "as a user, with valid credentials" do
    login
    lab = create(:lab, name: 'BCN')
    visit lab_path(lab)
    expect{ click_link "Edit Lab" }.to raise_error(ActiveRecord::RecordNotFound)
    # expect(page).to have_content("not authorized")
  end

end
