class ApplicationController < ActionController::Base
    private def current_user
        if session[:user_id]
            User.find_by(id:session[:user_id])
        end
    end

    private def login_required#ログインユーザだけ
        unless current_user
            #raise Login_required 
            flash[:alert]="ログインしてください"
            render("layouts/error")
        end
    end

    class Login_required < StandardError; end
    class Forbidden < StandardError; end

    helper_method :current_user
end
