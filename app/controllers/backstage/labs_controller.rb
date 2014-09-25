class Backstage::LabsController < Backstage::BackstageController

  def index
    @labs = Lab.with_accepted_state
  end

end
