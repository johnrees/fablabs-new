require 'rails_helper'

feature "viewing all submissions" do

  let(:lab) { build(:lab, name: 'Fab Lab Barcelona') }
  let(:submission) { create(:submission, lab: lab) }

  scenario "as a guest" do
    visit backstage_submissions_path
    expect(current_path).to eq(login_path)
  end

  scenario "as a user" do
    login
    visit backstage_submissions_path
    expect(page).to have_content('not authorized')
  end

  scenario "as a superadmin" do
    submission.reload
    login create(:superadmin)
    visit backstage_submissions_path
    expect(page).to have_link("Fab Lab Barcelona")
  end

end


feature "reviewing submissions" do

  let(:lab) { create(:lab, name: 'Fab Lab Cardiff') }
  # let(:submission) { create(:submission, lab: lab) }

  skip "rejecting submission" do
    lab.submission.update_attribute :workflow_state, :in_review
    login create(:superadmin)
    visit backstage_submissions_path
    click_link "Fab Lab Cardiff"
    click_button "Reject Submission"
    expect(page).to have_content("Rejected")
  end

end
