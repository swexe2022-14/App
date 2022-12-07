class TopController < ApplicationController
    def login
        if User.find_by(uid: params[:uid])
            signup = User.find_by(uid: params[:uid]).pass
            if BCrypt::Password.new(signup) == params[:pass]
                session[:login_uid] = params[:uid]
                redirect_to root_path
            else
                render 'error'
            end
        else
            render 'error'
        end
    end
    def login
        @user = User.find_by(uid: params[:uid])
        if BCrypt::Password.new(@user.pass) == params[:pass]
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
end
