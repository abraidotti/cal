class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mytrips = current_user.trips.all
    @alltrips = Trip.all
  end

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
    @trip.duration = @trip.end_time.localtime.strftime("%d").to_i - @trip.start_time.localtime.strftime("%d").to_i
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
      elsif get_event
        @thistrip = Trip.find(event_trip_params[:trip_ids])
        @thistrip.events << @event
        @thistrip.save
        redirect_to trip_path(@thistrip)
      else
        begin
          if @trip.update(trip_params)
            redirect_to trip_path(@trip)
          else
            redirect_to edit_trip_path(@trip), notice: @trip.errors.full_messages.last
          end
        rescue
          redirect_to edit_trip_path(@trip), notice: @trip.errors.full_messages.last
        end
      end
  end

  def remove
    @trip = Trip.find(params[:id])
    for i in 0...@trip.events.length do
       if @trip.events[i].id == params[:eventid].to_i
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
    params.require(:trip).permit(:name, :description, :start_time, :end_time, :trip_ids)
  end

  private
  def trip_event_params
    params.require(:trip).permit(:event_ids)
  end

  def get_event
    @event = Event.find_by_id(params[:id])
  end


  def find_trip
    @trip = Trip.find_by_id(params[:id])
  end
end
