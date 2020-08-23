class ChatsController < ApplicationController
    def index
        @chats=Chat.where(user_id:current_user.id)
        @new_chat=Chat.new(is_solved:false,isAdmin:false)]
    end

    def show
       
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
        redirect_to("/chats")
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
