require 'rails_helper'

feature "adding an event" do

  scenario "as a guest" do
    visit new_event_path
    expect(page).to have_content("please login")
  end

  scenario "as a user" do
    login
    visit events_path
    click_link "Add an Event"
    fill_in "Name", with: "Cool Event"
    fill_in "Description", with: "Cool Event Description"
    select_datetime 1.day.from_now, from: "event_starts_at"
    select_datetime (1.day.from_now + 1.hour), from: "event_ends_at"
    click_button "Add Event"
    expect(page).to have_content("event added")
  end

  scenario "as a user with missing params" do
    login
    visit events_path
    click_link "Add an Event"
    fill_in "Name", with: "Cool Event"
    click_button "Add Event"
    expect(page).to have_content("can't be blank")
  end

end
