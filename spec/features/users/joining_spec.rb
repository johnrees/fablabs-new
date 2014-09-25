require 'rails_helper'

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
    login
    visit join_path
    expect(page).to have_content('not authorized')
  end

end
