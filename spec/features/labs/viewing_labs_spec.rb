require 'rails_helper'

feature "viewing a lab" do

  background { create(:lab, name: "NASA", workflow_state: 'accepted') }

  scenario "as anyone" do
    visit labs_path
    click_link "NASA"
    expect(page).to have_title("NASA")
  end

end
