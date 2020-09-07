class Admin::MattersController < Admin::Base
    before_action :matter_check, :index

    def matter_check
        Matter.where(lost_id: nil).destroy_all
        Matter.where(eve: nil).destroy_all
    end
    
    def index
        @matters=Matter.all
    end

    def matter_params
        params.require(:matter).permit(:name)
    end
end
