class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    authorize @event
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def create
    @event = current_user.events.build event_params
    authorize @event
    if @event.save
      redirect_to events_url, notice: "event added"
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update_attributes event_params
      redirect_to events_url, notice: "Event updated"
    else
      render "edit"
    end
  end

private

  def event_params
    params.require(:event).permit(:name, :description, :starts_at, :ends_at)
  end

end
