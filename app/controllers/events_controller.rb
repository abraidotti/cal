class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :event_params, except: [:index, :new]

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
        if @event.save
          redirect_to event_path
        else
          redirect_to new_event_path, notice: @event.errors.full_messages.map { |error| @event.error }
        end
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time)
  end
end
