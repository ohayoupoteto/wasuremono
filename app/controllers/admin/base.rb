class Admin::Base < ApplicationController
    before_action :admin_login_required

    private def admin_login_required
        unless current_user&.admin
            raise Forbidden 
        end
    end
end