class Admin::ChatsController < Admin::Base
    def index
        @users=User.where(admin:false)
        @user_name=[]
        @users.each do |user|
            if Chat.find_by(user_id:user.id)
                @user_name<<user.name
            end
        end
        @user_name=@user_name.uniq
        
    end

    def show
        @chats=Chat.where(user_id:params[:id])
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

end
