class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_time_zone, if: :user_signed_in?

  private

    def set_time_zone
      Time.zone = current_user.time_zone
    end
end


end
