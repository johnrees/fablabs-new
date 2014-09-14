require 'rails_helper'

feature "Requesting a recovery" do

  scenario "as a valid user" do
    user = create(:user)
    visit login_path
    click_link "Forgot Password?"
    fill_in 'Email', with: user.email
    click_button 'Reset Password'
    expect(page).to have_content('Recovery instructions should appear in your inbox soon.')
    expect(last_email.to).to include(user.email)
  end

  scenario "as an unregistered user" do
    visit login_path
    click_link "Forgot"
    fill_in 'Email', with: 'steve@jobs.com'
    click_button 'Reset Password'
    expect(page).to have_content('Sorry')
  end

end

feature "Resetting your password" do

  given(:user) { create(:user) }

  scenario "with a valid password" do
    recovery = create(:recovery, user: user, email: user.email)
    visit recovery_url(user.recovery_key)
    # expect(page).to_not have_link('Sign in')
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    click_button 'Reset Password'
    expect(page).to have_content('Password reset')
    expect(page).to have_link('Log out')
  end

  scenario "with an invalid url" do
    expect{visit recovery_url('invalidkey')}.to raise_error(ActiveRecord::RecordNotFound)
  end

  scenario "with an empty password" do
    recovery = create(:recovery, user: user, email: user.email)
    visit recovery_url(user.recovery_key)
    # expect(page).to_not have_link('Sign in')
    click_button 'Reset Password'
    expect(page).to have_content("can't be blank")
  end

end
