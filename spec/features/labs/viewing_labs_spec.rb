require 'rails_helper'

feature "viewing a lab" do

  background { create(:lab, name: "NASA") }

  scenario "as a guest" do
    visit labs_path
    click_link "NASA"
    expect(page).to have_title("NASA")
  end

  skip "as a user"

  skip "as an authorised user"

end
