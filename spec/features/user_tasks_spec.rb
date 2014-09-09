require 'spec_helper'

feature "joining" do

  scenario "with correct credentials" do
    visit root_path
    click_link "Join"
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Rees'
    fill_in 'Email', with: 'john@bitsushi.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Join'
    expect(page).to have_content("Thank you")
  end

  scenario "with incorrect credentials" do
    visit join_path
    fill_in 'Email', with: 'johnbitsushi.com'
    click_button 'Join'
    expect(page).to have_content("invalid")
  end

  scenario "when already logged in" do
    visit login_path
    fill_in "Email", with: "john@bitsushi.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit join_path
    expect(page).to have_content('already logged in')
  end

end

feature "logging in" do

  scenario "with correct credentials" do
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "john@bitsushi.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Hello")
  end

  scenario "when already logged in" do
    visit login_path
    fill_in "Email", with: "john@bitsushi.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit login_path
    expect(page).to have_content('already logged in')
  end

  scenario "with incorrect credentials" do
    visit login_path
    fill_in "Email", with: "john@bitsushi.com"
    fill_in "Password", with: "wrong"
    click_button "Log in"
    expect(page).to have_content("invalid")
  end

end

feature "logging out" do

  scenario "when logged in" do
    visit login_path
    fill_in "Email", with: "john@bitsushi.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_link "Log out"
    expect(page).to have_content("Logged out")
  end

end

feature "changing details" do
  skip "resetting password"
  skip "changing password"
  skip "changing details"
end

feature "visiting profile pages" do

  scenario "profile page" do
    user = FactoryGirl.create(:user, first_name: "Bart")
    visit user_path(user)
    expect(page).to have_title("Bart")
  end

end
