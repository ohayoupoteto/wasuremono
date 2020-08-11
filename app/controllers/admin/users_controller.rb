class Admin::UsersController < Admin::Base
    #wrap_parameters :user, include: [:name, :password, :password_confirmation]
    def index
        
    end

    def show

    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end

    params.require(:member).permit(:name,:faculty,:grade,:admin,:student_id,:password,:password_confirmation)

end
