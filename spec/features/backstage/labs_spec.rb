require 'rails_helper'

feature "viewing all labs" do

  background { create(:lab, name: "NASA") }

  scenario "as a guest" do
    visit backstage_labs_path
    expect(current_path).to eq(login_path)
  end

  scenario "as a user" do
    login
    visit backstage_labs_path
    expect(page).to have_content('not authorized')
  end

  scenario "as a superadmin, with new lab" do
    login create(:superadmin)
    visit backstage_labs_path
    expect(page).to_not have_link("NASA")
  end

  scenario "as a superadmin, with accepted lab" do
    create(:lab, workflow_state: 'accepted', name: "NASA2")
    login create(:superadmin)
    visit backstage_labs_path
    expect(page).to have_link("NASA2")
  end

end
