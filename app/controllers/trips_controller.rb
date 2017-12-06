class TripsController < ApplicationController
  before_action :authenticate_user!

  def show
    find_trip
  end

  def new
    @trip = Trip.new
  end

  def edit
    find_trip
  end

  def create
    current_user
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.save
    if @trip.save
      redirect_to root_path
    else
      redirect_to new_trip_path, notice: @trip.errors.full_messages.last
    end
  end

  def update
    find_trip
      if trip_event_params[:event_ids]
        @trip.events << Event.find(trip_event_params[:event_ids])
        @trip.save
        redirect_to trip_path(@trip)
      else
        begin
          if @trip.update(trip_params)
            redirect_to trip_path(@job)
          else
            redirect_to edit_trip_path(@trip), notice: @trip.errors.full_messages.last
          end
        rescue
          redirect_to edit_trip_path(@trip), notice: @trip.errors.full_messages.last
        end
      end

  def remove
    @trip = Trip.find(params[:id])
    for i in 0...@trip.events.length do
      if @trip.events[i].id == params[:event_id].to_i
        @trip.events.delete(@trip.events[i])
        @trip.save
        break
      end
    end
    redirect_to trip_path(@trip)
  end

  def destroy
    find_trip
    @trip.destroy

    redirect_to '/'
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_time, :end_time)
  end

  def find_trip
    @trip = Trip.find_by_id(params[:id])
  end
end
