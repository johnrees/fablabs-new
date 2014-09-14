require 'rails_helper'

feature "visiting the homepage" do

  scenario "as a guest" do
    visit root_url
    expect(page).to have_content("where to make almost anything")
  end

end
