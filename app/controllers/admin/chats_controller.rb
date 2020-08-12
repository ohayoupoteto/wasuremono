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
        @new_chat=Chat.new(is_solved:false,isAdmin:true)
        @user_id=params[:id]
    end

    def new

    end

    def create
        @chat=Chat.new(chat_params)
        if @chat.save
            flash[:notice]="送信しました"
        else
            flash[:notice]="送信できませんでした"
        end
        redirect_to("/admin/chats/#{params[:chat][:user_id]}")
    end

    def edit

    end

    def update

    end

    def destroy

    end

    def chat_params
        params.require(:chat).permit(:sentence,:isAdmin,:is_solved,:user_id)
    end

end
