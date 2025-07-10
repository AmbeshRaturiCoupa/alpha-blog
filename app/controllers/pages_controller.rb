class PagesController < ApplicationController

    def show
    end
 
    def home
        redirect_to articles_path if logged_in?
    end
end