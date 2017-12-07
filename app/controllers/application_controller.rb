$locations = ['1419 South Mole St, Philadelphia, PA', '2314 East Harold St, Philadelphia, PA', '1710 Naudain St, Philadelphia, PA', '1502 South Broad St, Philadelphia, PA', '826 Morris St, Philadelphia, PA']
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:fname, :lname]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  protect_from_forgery with: :exception

  private

    def set_time_zone
      Time.zone = current_user.time_zone
    end
end
