require 'rails_helper'

feature "changing user details" do

  scenario "resetting password" do
    visit root_path
    click_link "Log in"
    click_link "Forgot Password?"
  end

  scenario "changing password" do
    user = create(:user)
    login user
    click_link "Change Password"
    fill_in "Original password", with: user.password
    fill_in "New password", with: "newpassword"
    fill_in "New password confirmation", with: "newpassword"
    click_button "Change Password"
    expect(page).to have_content("Successfully changed")
  end

  scenario "incorrect details" do
    user = create(:user)
    login user
    click_link "Change Password"
    fill_in "Original password", with: nil
    fill_in "New password", with: "newpassword"
    fill_in "New password confirmation", with: "newpassword"
    click_button "Change Password"
    expect(page).to have_content("Form is invalid")
  end

  skip "changing details"

end


