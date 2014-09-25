class Backstage::SubmissionsController < Backstage::BackstageController

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    authorize @submission
  end

end
