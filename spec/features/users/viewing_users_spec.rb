require 'spec_helper'

feature "visiting profile pages" do

  scenario "profile page" do
    user = create(:user, first_name: "Bart")
    visit user_path(user)
    expect(page).to have_title("Bart")
  end

end