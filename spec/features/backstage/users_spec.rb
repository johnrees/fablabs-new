require 'rails_helper'

feature "viewing all users" do

  background { create(:user, first_name: "Peter", last_name: "Griffin") }

  scenario "as a guest" do
    visit backstage_users_path
    expect(current_path).to eq(login_path)
  end

  scenario "as a user" do
    login
    visit backstage_users_path
    expect(page).to have_content('not authorized')
  end

  scenario "as a superadmin" do
    login create(:superadmin)
    visit backstage_users_path
    expect(page).to have_link("Peter Griffin")
  end

end
