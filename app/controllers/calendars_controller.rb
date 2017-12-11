class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = current_user.trips.all
    @events = current_user.events.all
  end

  def show
    @date = params[:format]
    @trips = current_user.trips.all
  end
end
