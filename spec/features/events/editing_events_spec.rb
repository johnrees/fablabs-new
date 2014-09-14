require 'rails_helper'

feature "editing an event" do

  skip "as a guest"

  skip "as an unauthorised user"

  scenario "as an authorised user with valid credentials" do
    event = create(:event)
    login event.creator
    visit event_path(event)
    click_link "Edit Event"
    fill_in "Name", with: "New Name"
    click_button "Update Event"
    expect(page).to have_content('updated')
  end

  scenario "as an authorised user with invalid credentials" do
    event = create(:event)
    login event.creator
    visit event_path(event)
    click_link "Edit Event"
    fill_in "Name", with: nil
    click_button "Update Event"
    expect(page).to have_content("can't be blank")
  end

end
