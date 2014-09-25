class SubmissionsController < ApplicationController

  before_filter :require_login

  def index
    @submissions = current_user.submissions
  end

  def show
    @submission = current_user.submissions.find(params[:id])
    authorize @submission
  end

  def accept
    @submission = Submission.find(params[:id])
    authorize @submission, :update?
    @submission.accept!
    redirect_to @submission
  end

end
