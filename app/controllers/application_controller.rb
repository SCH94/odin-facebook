class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :get_header_info

  private

    def logged_in_user
      unless user_signed_in?
        flash[:alert] = 'Please login or signup'
        redirect_to root_url
      end
    end
    
    def get_header_info
      @request_count = current_user.requests.count if current_user
      @comrade_count = current_user.comrades.count if current_user
    end
end
