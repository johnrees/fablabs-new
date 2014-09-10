require 'spec_helper'

feature "visiting profile pages" do

  scenario "profile page" do
    user = create(:user, first_name: "Bart")
    visit user_path(user)
    expect(page).to have_title("Bart")
  end

end

feature "listing users" do
  scenario "index page" do
    create(:user, first_name: "Bart")
    create(:user, first_name: "Maggie")
    create(:user, first_name: "Marge")
    visit users_path
    expect(page).to have_link("Bart Simpson")
    expect(page).to have_link("Maggie Simpson")
    expect(page).to have_link("Marge Simpson")
  end
end
