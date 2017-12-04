class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events.all
  end

  def show
    @events = current_user.events.all
  end
end
