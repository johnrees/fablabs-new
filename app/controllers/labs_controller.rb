class LabsController < ApplicationController

  def index
    @labs = Lab.all
  end

  def show
    @lab = Lab.find(params[:id])
  end

  def new
    @lab = Lab.new
  end

  def edit
    @lab = Lab.find(params[:id])
  end

  def create
    @lab = Lab.new lab_params
    if @lab.save
      redirect_to labs_url, notice: "Thanks"
    else
      render "new"
    end
  end

  def update
    @lab = Lab.find(params[:id])
    if @lab.update_attributes lab_params
      redirect_to labs_url, notice: "Lab updated"
    else
      render "edit"
    end
  end

private

  def lab_params
    params.require(:lab).permit(:name, :description)
  end

end
