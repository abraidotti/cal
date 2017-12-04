class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @calendar = Calendar.where(user_id: current_user.id)
    @events = Event.all
  end

  def show
    @events = Events.all
  end
end
