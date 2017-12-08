class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mytrips = current_user.trips.all
    @alltrips = Trip.all
  end

  def show
    find_trip
    @events =  @trip.events.all
    @markers = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.description
    end
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
        @event = Event.find(trip_event_params[:event_ids])
        if @event.start_time >= @trip.start_time
          @trip.events << @event
          @trip.save
          redirect_to trip_path(@trip)
        else
          flash[:notice] = 'This event does not fall within your trip duration!'
          redirect_to @trip
        end
      else @trip.update(trip_params)
        redirect_to @trip
      end
  end

  def remove
    @trip = Trip.find(params[:id])
    for i in 0...@trip.events.length do
       if @trip.events[i].id == params[:eventid].to_i
         @trip.events.delete(@trip.events[i])
         @trip.duration = @trip.end_time.localtime.strftime("%d").to_i - @trip.start_time.localtime.strftime("%d").to_i
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
