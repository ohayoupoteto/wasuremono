class SessionsController < ApplicationController
    def create #ログイン
        user=User.find_by(student_id:params[:student_id])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            flash.alert="ログインに成功しました"
        else
            flash.alert="ログインに失敗しました"
        end
        redirect_to("/admin/losts")
    end

    def destroy #ログアウト
        session.delete(:user_id)
        redirect_to("/")
    end
    def top
        flash.alert="こんにちわ"
    end
end
