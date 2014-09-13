require 'spec_helper'

feature "editing a lab" do

  skip "as lab owner, with valid credentials" do
    user = create(:user)
    lab = create(:lab, name: 'BCN', creator: user)
    login user
    visit lab_path(lab)
    click_link "Edit Lab"
    fill_in "Name", with: "BCN2"
    click_button "Update Lab"
    expect(page).to have_content("not authorized")
  end

  skip "as user, with valid credentials" do
    login
    lab = create(:lab, name: 'BCN')
    visit lab_path(lab)
    click_link "Edit Lab"
    expect(page).to have_content("not authorized")
  end

end
