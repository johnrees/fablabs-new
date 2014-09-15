require 'rails_helper'

feature "editing an event" do

  given(:event) { create(:event) }

  scenario "as a guest" do
    visit edit_event_path(event)
    expect(page).to have_content("please login")
  end

  scenario "as an unauthorised user" do
    login
    visit edit_event_path(event)
    expect(page).to have_content("not authorized")
  end

  scenario "as an authorised user with valid credentials" do
    login event.creator
    visit event_path(event)
    click_link "Edit Event"
    fill_in "Name", with: "New Name"
    click_button "Update Event"
    expect(page).to have_content('updated')
  end

  scenario "as an authorised user with invalid credentials" do
    login event.creator
    visit event_path(event)
    click_link "Edit Event"
    fill_in "Name", with: nil
    click_button "Update Event"
    expect(page).to have_content("can't be blank")
  end

end
