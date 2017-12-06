$locations = ['1419 South Mole St, Philadelphia, PA', '2314 East Harold St, Philadelphia, PA', '1710 Naudain St, Philadelphia, PA', '1502 South Broad St, Philadelphia, PA', '826 Morris St, Philadelphia, PA']
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def set_time_zone
      Time.zone = current_user.time_zone
    end
end
