require 'spec_helper'

feature "homepage" do
  scenario "visiting the homepage" do
    visit root_url
    expect(page).to have_content("where to make almost anything")
  end
end
