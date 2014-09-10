require 'spec_helper'

feature "viewing a lab" do

  scenario "profile page" do
    create(:lab, name: "NASA")
    visit labs_path
    click_link "NASA"
    expect(page).to have_title("NASA")
  end

end
