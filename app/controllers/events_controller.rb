class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.order(:id)
      if params[:order] == 'cost'
          @events = Event.all.order('cost')
      elsif params[:order] == 'name'
          @events = Event.all.order('name')
      elsif params[:order] == 'location'
          @events = Event.all.order('location')
      elsif params[:order] == 'start_time'
          @events = Event.all.order('start_time')
      elsif params[:order] == 'duration'
          @events = Event.all.order('duration')
      else
          @events = Event.all
      end
    @markers = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @event.end_time = @event.start_time + @event.duration.hours
    @trip = Trip.find_by_id(params[:id])
    @markers = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.description
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      @event.user_id = current_user.id
      current_user.events << @event
      redirect_to events_path
    else
      redirect_to new_event_path, notice: @event.errors.full_messages.each
    end
  end

  def update
    @event = Event.find_by_id(params[:id])
    @trip = Trip.find_by_id(event_trip_params[:trip_ids])
    if event_params[:name]
      if @event.update(event_params)
        @event.end_time = @event.start_time + @event.duration.hours
        redirect_to event_path(@event)
      else
        render 'edit'
      end
    elsif @event.start_time >= @trip.start_time && @event.start_time < @trip.end_time
      @trip.events << @event
      redirect_to trip_path(@trip) if @trip.save
    else
      flash[:notice] = 'This event starts before your trip, but you can still clone it at the bottom of this page!'
      redirect_to @event
    end
  end

  def destroy
    event = Event.find_by_id(params[:id])
    event.destroy

    redirect_to '/'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :duration, :cost, :trip_ids)
  end

  def event_trip_params
    params.require(:event).permit(:trip_ids)
  end
end
