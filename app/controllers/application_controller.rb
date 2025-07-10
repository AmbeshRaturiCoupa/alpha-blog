class ApplicationController < ActionController::Base
    

    #this will make current_user available to views as well
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert]="You need to login to continue"
            redirect_to login_path
        end
    end
end
