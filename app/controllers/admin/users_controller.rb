class Admin::UsersController < Admin::Base
    #wrap_parameters :user, include: [:name, :password, :password_confirmation]
    def index
        @users=User.all
    end

    def show
        @user=User.find(params[:id])
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

    def user_params
        params.require(:member).permit(:name,:faculty,:grade,:admin,:student_id,:password,:password_confirmation)
    end
end
