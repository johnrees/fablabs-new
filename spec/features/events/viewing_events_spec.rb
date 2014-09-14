require 'rails_helper'

feature "viewing events" do

  scenario "viewing the index" do
    create(:event, name: "fun event")
    visit root_path
    click_link "Events"
    expect(page).to have_link("fun event")
  end

  scenario "viewing an individual event" do
    event = create(:event)
    visit events_path
    click_link event.name
    expect(page).to have_title(event)
  end

end
