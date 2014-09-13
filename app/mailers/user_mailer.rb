class UserMailer < ActionMailer::Base
  default from: "support@fablabs.io"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.register.subject
  #
  def register
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def account_recovery_instructions user_id
    @user = User.find(user_id)
    mail(to: @user.email_string, subject: "Account Recovery Instructions")
  end

end
