class LessonsController < ApplicationController
    def index
        @lessons=Lesson.all
    end

    def show

    end

    def new
        @lesson=Lesson.new
        
        @classrooms=Classroom.all
        @classrooms_array=[]#選択用の教室の配列を用意
        @classrooms.each do |classroom|
            id=classroom.id
            name=classroom.name
            @classrooms_array << [name,id]
        end
    end

    def create
        @lesson=Lesson.new(lesson_params)
        if @lesson.save
            flash[:notice]="授業を追加しました"
            redirect_to("/lessons")
        else
            flash[:notice]="追加できませんでした。"
            render("lesson#new")
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    def lesson_params
        params.require(:lesson).permit(:name,:teacher,:classroom_id)
    end

end
