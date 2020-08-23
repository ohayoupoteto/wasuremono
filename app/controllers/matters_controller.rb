class MattersController < ApplicationController
    def q1
        @matter=Matter.new(user_id:current_user.id)
        @classrooms=Classroom.all
        @classrooms_array=[]#選択用の教室の配列を用意
        @classrooms.each do |classroom|
            id=classroom.id
            name=classroom.name
            @classrooms_array << [name,id]
        end
        @lessons=Lesson.all
        @lessons_array=[]
        @lessons.each do |lesson|
            lesson
        end

    end

    def q1_after

    end

    
    def q2
    end

    def q2_after
    end
    

    def q3
    end

    def q3_after
    end

    def matter_params
        params.require(:matter).permit(:name)
    end
end
