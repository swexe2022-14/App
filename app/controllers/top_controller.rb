class TopController < ApplicationController
    def login
        @user = User.find_by(uid: params[:uid])
        logger.debug(@user.pass)
        logger.debug(params[:pass])
        if BCrypt::Password.new(@user.pass) == params[:pass]
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render "login_page" 
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
