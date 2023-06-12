class UsersController < ApplicationController


    # before_action :require_logged_in, only: [:index,:show,:edit,:update]
    before_action :require_logged_out, only: [:new,:create]

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            
            redirect_to cats_url
            login(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end


end 