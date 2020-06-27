class LostsController < ApplicationController

    def index
        @losts=Lost.all
    end

    def show
        @lost=Lost.find(params[:id])
    end

    def new
        @lost=Lost.new
        
        @lessons=Lesson.all
        @lesson_array=[]#選択用の教室の配列を用意
        @lessons.each do |lesson|
            id=lesson.id
            name=lesson.name
            @lesson_array << [name,id]
        end
    end

    def create
        @lost=Lost.new(lost_params)
        if @lost.save
            flash[:notice]="授業を追加しました"
            redirect_to("/losts")
        else
            flash[:notice]="追加できませんでした。"
            render("lost/new")
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    def lost_params
        params.require(:lost).permit(:name,:category,:detail,:lesson_id)
    end

end
