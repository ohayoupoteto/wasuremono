class Admin::Base < ApplicationController
    before_action :admin_login_required

    private def admin_login_required
        unless current_user&.admin
            #raise Forbidden 
            flash[:alert]="無効な操作です"
            render("layouts/error")
        end
    end
end