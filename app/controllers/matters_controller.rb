class MattersController < ApplicationController
    before_action :login_required
    def q1
        @matter=Matter.new(user_id:current_user.id)
        #@classrooms=Classroom.all
        #@classrooms_array=[]#選択用の教室の配列を用意
        #@classrooms.each do |classroom|
            #id=classroom.id
            #name=classroom.name
            #@classrooms_array << [name,id]
        #end
        @lessons=current_user.lessons
        @lessons_array=["忘れ物をした授業を選択"]
        @lessons.each do |lesson|
            @lessons_array << lesson.name
        end
        @losts=Lost.all
        @categorys_array=["忘れ物の種類を選択"]
        @losts.each do |lost|
            @categorys_array << lost.category
        end
        @categorys_array=@categorys_array.uniq

    end

    def q1_after
        @matter=Matter.new(user_id:current_user.id, is_solved:false)
        @lesson=Lesson.find_by(name:params[:lesson])
        category=params[:category]
        if @matter.save! #lesson_idが空の状態
            redirect_to("/q2/#{@matter.id}/#{@lesson.id}/#{category}")
        else
            flash[:notice]="やり直してください"
            redirect_to("/q1")
        end

    end

    
    def q2
        @matter=Matter.find(params[:id])
        @losts=Lost.where(lesson_id:params[:lesson_id],category:params[:category]).page(params[:page]).per(30)

    end

    def q2_after
    end
    

    def q3
        @matter=Matter.find(params[:id])
        @lost=Lost.find(params[:lost_id])
        @matter.lost = @lost
        @matter.save!
    end

    def q3_after
        @matter=Matter.find(params[:id])
        @matter.eve=params[:matter][:eve]
        if @matter.save!
            flash[:notice]="申請を完了しました。"
        else
            flash[:alert]="やり直してください"
        end
        redirect_to("/")
    end

    def matter_params
        params.require(:matter).permit(:name)
    end
end
