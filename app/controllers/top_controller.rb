class TopController < ApplicationController
    def login
        @user = User.find_by(uid: params[:uid])
        if BCrypt::Password.new(@user.pass) == params[:user][:pass]
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render root_path
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
    
    def confirmation
       if params[:passcode] == User.code
           redirect_to financials_new_path
       end
    end
end
