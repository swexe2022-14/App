class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(
            uid: params[:user][:uid],
            pass: params[:user][:pass],
            code: params[:user][:code])
        if @user.save
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render new_user_path
        end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end
