class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = current_user.trips.all
  end

  def show
    @date = params[:format]
    @events = current_user.events.all
  end
end
