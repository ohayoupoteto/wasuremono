class Admin::ChatsController < Admin::Base
    def start
        @chats=Chat.new(user_id:params[:user_id], isAdmin:true, is_solved:false, 
        sentence:"トークルームが開設されました。こんにちわ#{User.find(params[:user_id]).name}さん。")
        if @chats.save!

        else

        end
        redirect_to("/admin/chats")
    end

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
        @chat_user_name=Chat.where(user_id:params[:id]).first.user.name #チャットしている生徒の名前を取得
    end

    def new

    end

    def create
        @chat=Chat.new(chat_params)
        if @chat.save
            flash[:notice]="送信しました"
        else
            flash[:alert]="送信できませんでした"
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
