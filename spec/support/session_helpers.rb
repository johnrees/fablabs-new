# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers

    def login(user = nil)
      user ||= create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    # def sign_up_as user
    #   visit signup_path
    #   fill_in 'user_first_name', with: user.first_name
    #   fill_in 'user_last_name', with: user.last_name
    #   fill_in 'Username', with: user.username
    #   fill_in 'Email', with: user.email
    #   fill_in 'user_password', with: user.password
    #   fill_in 'user_password_confirmation', with: user.password_confirmation
    #   click_button 'Sign Up'
    # end

    # def sign_in_admin_for resource
    #   admin = FactoryGirl.create(:user)
    #   admin.add_role :admin, resource
    #   sign_in admin
    # end

    # def sign_in_superadmin
    #   superadmin = FactoryGirl.create(:user)
    #   superadmin.add_role :superadmin
    #   sign_in superadmin
    # end

  end
end
