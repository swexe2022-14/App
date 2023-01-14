class TopController < ApplicationController
    def login
        @user = User.find_by(uid: params[:uid])
        #logger.debug(@user.pass)
        #logger.debug(params[:pass])
        if BCrypt::Password.new(@user.pass) == params[:pass]
            session[:user_id] = @user.id
            redirect_to spends_path
        else
            render "login_page" 
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
    
    def confirmation_1
        if User.find_by(code: params[:passcode])
            redirect_to new_spend_path
        else
            render top_passcode_2_path
        end
    end
    
    def confirmation_2
        if User.find_by(code: params[:passcode])
            redirect_to new_financial_path
        else
            render top_passcode_1_path
        end
    end
    
    def confirmation_3
        if User.find_by(code: params[:passcode])
            redirect_to financials_path
        else
            render top_passcode_3_path
        end
    end
end
