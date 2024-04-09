class ApplicationController < ActionController::Base
    helper_method :current_owner, :logged_in?

    def current_owner
        @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
    end

    def logged_in?
        !!current_owner
    end

end
