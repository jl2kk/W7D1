class UsersController < ApplicationController


    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to users_url(@user)
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