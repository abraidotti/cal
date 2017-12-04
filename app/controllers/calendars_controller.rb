class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = Event.find(params[:id])
  end
end
