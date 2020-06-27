class ClassroomsController < ApplicationController
    def index
        @classrooms=Classroom.all
    end

    def show

    end

    def new
        @classroom=Classroom.new
    end

    def create
        @classroom=Classroom.new(classroom_params)
        if @classroom.save
            flash[:notice]="教室を追加しました"
            redirect_to("/classrooms")
        else
            flash[:notice]="追加できませんでした。"
            render("classroom#new")
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end
    
    def classroom_params
        params.require(:classroom).permit(:name)
    end

end