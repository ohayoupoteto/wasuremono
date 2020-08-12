class SessionsController < ApplicationController
    def create #ログイン
        user=User.find_by(student_id:params[:student_id])
        if user && user&.authenticate(params[:password])
            session[:user_id]=user.id
            flash.alert="ログインに成功しました"
            if current_user.admin?
                redirect_to("/admin/losts")
            else
                redirect_to("/chats")
            end
        else
            flash.alert="ログインに失敗しました"
            redirect_to("/")
        end
        
    end

    def destroy #ログアウト
        session.delete(:user_id)
        redirect_to("/")
    end
    def top
        flash.alert="こんにちわ"
    end
end
