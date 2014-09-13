require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  let(:user) { create(:user) }

  describe "register" do
    let(:mail) { UserMailer.register }

    skip "send user welcome mailer" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
      expect(mail.body.encoded).to match("Hi")
    end

  end

  describe "account recovery" do
    let(:mail) { UserMailer.account_recovery_instructions(user) }

    it "account_recovery_instructions" do
      recovery = create(:recovery, user: user, email: user.email)
      mail = UserMailer.account_recovery_instructions(user.id)
      expect(mail.subject).to match("Account Recovery Instructions")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["support@fablabs.io"])
      expect(mail.body.encoded).to match(recovery_url(user.recovery_key))
    end

  end

end
