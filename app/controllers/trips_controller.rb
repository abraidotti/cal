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
    @trip.calendar_id = current_user.calendar.id
    @trip.save
    if @trip.save
      redirect_to root_path
    else
      redirect_to new_trip_path, notice: @trip.errors.full_messages.last
    end
  end

  def update
    find_trip
    if @trip.update(trip_params)
      redirect_to @trip
    else
      render '/trip/edit'
    end
  end

  def destroy
    find_trip
    @trip.destroy

    redirect_to '/'
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_time, :end_time, :user_id, :calendar_id)
  end

  def find_trip
    @trip = Trip.find_by_id(params[:id])
  end
end
