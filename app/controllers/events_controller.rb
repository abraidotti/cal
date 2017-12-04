class EventsController < ApplicationController
  before_action :authenticate_user!

  def show
    @event = Event.find_by_id(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      redirect_to events_new_path, notice: @event.errors.full_messages.last
    end
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time)
  end
end
