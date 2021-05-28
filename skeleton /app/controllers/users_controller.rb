class UsersController < ApplicationController


    def new 
        @user = User.new
        render :new
    end 

    def create  
        @user = User.new(params[:id])
        if @user.save
            redirect_to user_url(@user)
        else
            render :new
        end

    end


    def user_params
        params.require(:user).permits(:user_name, :password)
    end
end 