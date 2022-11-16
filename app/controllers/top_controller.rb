class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else 
            render "login"
        end
    end
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
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
