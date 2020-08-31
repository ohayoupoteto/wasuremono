class Admin::MattersController < Admin::Base
    
    def index
        @matters=Matter.all
    end

    def matter_params
        params.require(:matter).permit(:name)
    end
end
