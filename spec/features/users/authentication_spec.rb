require 'rails_helper'

feature "authentication" do

  given(:user) { create(:user) }

  feature "logging in" do

    scenario "login button on homepage" do
      visit root_path
      expect(page).to have_link("Log in")
    end

    scenario "with correct credentials" do
      login
      expect(page).to have_content("Hello")
    end

    scenario "when already logged in" do
      login
      visit login_path
      expect(page).to have_content('already logged in')
    end

    scenario "with incorrect credentials" do
      login build(:user, password: 'incorrect')
      expect(page).to have_content("invalid")
    end

  end

  feature "logging out" do

    scenario "when logged in" do
      login
      click_link "Log out"
      expect(page).to have_content("Logged out")
    end

  end

end
