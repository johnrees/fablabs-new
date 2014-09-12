require 'spec_helper'

feature "viewing events" do

  scenario "index page" do
    create(:event, name: "fun event")
    visit root_path
    click_link "Events"
    expect(page).to have_link("fun event")
  end

  skip "adding an event" do
    visit events_path
    click_link "Add an Event"
    fill_in "Name", with: "Cool Event"
    click_button "Add Event"
    expect(page).to have_content("event added")
  end

  skip "editing an event"
  skip "cancelling an event"

end
