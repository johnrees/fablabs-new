class Backstage::LabsController < Backstage::BackstageController

  def index
    @labs = Lab.all
  end

end
