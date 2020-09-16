class Admin::UsersController < Admin::Base
    #wrap_parameters :user, include: [:name, :password, :password_confirmation]
    
    def index
        @users=User.all.page(params[:page]).per(20)
    end

    def show
        @user=User.find(params[:id])
        @lessons=@user.lessons
        #@a=TakeLesson.where(user_id:@user.id)
        #@lessons=[]
        #@a.each do |a|
            #@lessons<<Lesson.find(a.lesson_id)
        #end
    end
    def new
        @user=User.new
        @lessons=Lesson.all
        @lessons_array=[]#選択用の教室の配列を用意
        @lessons.each do |lesson|
            @lessons_array << lesson.name
        end
    end

    def create
        @user=User.new(user_params)
        @user.admin=false
        @lesson_ids=params[:user][:lesson_ids]
        @lesson_ids.shift
        if @user.save
            @lesson_ids.each do |lesson_id|#その生徒がとっている授業と関連づける
                lesson=Lesson.find(lesson_id.to_i)
                @user.lessons << lesson
            end
            flash[:notice]="生徒を追加しました"
            redirect_to("/admin/users")
        else
            flash[:alert]="生徒を追加できませんでした"
            redirect_to("/admin/users/new")
        end

    end
    def edit
        @user=User.find(params[:id])
        @lessons=Lesson.all
    end

    def update
        @user=User.find(params[:id])
        @user.assign_attributes(user_params)
        @lesson_ids=params[:user][:lesson_ids]
        @lesson_ids.shift
        if @user.save
            @lesson_ids.each do |lesson_id|#その生徒がとっている授業と関連づける
                lesson=Lesson.find(lesson_id.to_i)
                @user.lessons << lesson
            end
            flash[:notice]="生徒を編集できました"
            
        else
            flash[:alert]="生徒を編集できませんでした"
            #render("users#edit")
        end
        redirect_to("/admin/users")

    end

    def destroy
        @user=User.find(params[:id])
        if @user.destroy
            flash[:notice]="生徒を削除できました"
        else
            flash[:notice]="生徒を削除できませんでした"
        end
        redirect_to("/admin/users")
    end

    def user_params
        params.require(:user).permit(:name,:faculty,:grade,:student_id,:email,:password,:password_confirmation)
    end
end
