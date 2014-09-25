require 'rails_helper'


feature "viewing all submissions" do

  let(:submission) { create(:submission) }

  scenario "as a submitter" do
    login submission.creator
    visit submissions_path
    expect(page).to have_link(submission.to_s)
  end

end

feature "viewing a submission" do

  scenario "as a submitter" do
    submission = create(:submission)
    login submission.creator
    visit submission_path(submission)
    expect(page).to have_content('Comments')
  end

end
