class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password]) 
            session[:user_id] = user.id # this will allow user to loged in
            flash[:notice] = "You have successfully logged in"
            redirect_to user

        else
            flash.now[:alert] = "Invalid email or password"
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil # this will log out the user
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end
end