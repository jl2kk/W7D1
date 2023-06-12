class SessionsController < ApplicationController

    # before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new,:create]

    def new
        render :new 
    end 



    def create 
        username = params[:user][:username]
        password = params[:user][:password]
        @user = User.find_by_credentials(username,password)

        if @user
            @user.save
            login(@user)
            redirect_to cats_url
        else 
            render :new
        end 

    end 

    def destroy

        logout!
        redirect_to new_session_url
    end 


end 