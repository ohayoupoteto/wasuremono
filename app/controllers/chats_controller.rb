class ChatsController < ApplicationController
    def index
        @chats=Chat.where(user_id:current_user.id)
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

end
