class Admin::UsersController < Admin::Base
    
  require "csv" #生徒一括追加用

    def index
        @users=User.all.page(params[:page]).per(20)
    end

    def show
        @user=User.find(params[:id])
        @lessons=@user.lessons

    end
    def new
        @user=User.new
        @lessons=Lesson.all
        @lessons_array=[]#選択用の教室の配列を用意
        @lessons.each do |lesson|
            @lessons_array << lesson.name
        end
    end

    def new_multi
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

    def create_multi
        file=params[:file] #受け取ったCSVファイル
        isSaveall=true; #全ての人を登録できたか
        CSV.foreach(file.path, headers: true) do |row|
            user=User.new(student_id: row[0], #なぜかrow["学籍番号"]で取得できないので止む無くインデックスで指定
                 name: row["氏名"], 
                 faculty: row["学部"], 
                 grade: row["学年"].to_i, 
                 email: row["メールアドレス"], 
                 password: row["パスワード"], 
                 password_confirmation: row["パスワード"], 
                 admin: false)
            unless user.save!
                isSaveall=false
                flash[:alert]="ユーザーを登録できませんでした。"
                render("layouts/error")
            end
        end
        if isSaveall
            flash[:notice]="ユーザーが登録されました。"
        else
            flash[:alert]="全てのユーザーを登録できませんでした。"
        end

        redirect_to("/admin/users")
    end

    def download #CSVファイルのダウンロード
        filepath = Rails.root.join("app", "assets", "csvs" ,"wasuremono_template.csv")
        stat = File::stat(filepath)
        send_file(filepath, filename:'忘れ物_テンプレート.csv',type: "text_csv")
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
                unless @user.lessons.include?(lesson)#授業を重複させない
                  @user.lessons << lesson
                end
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
            flash[:notice]="生徒を削除しました"
        else
            flash[:notice]="生徒を削除できませんでした"
        end
        redirect_to("/admin/users")
    end

    def user_params
        params.require(:user).permit(:name,:faculty,:grade,:student_id,:email,:password,:password_confirmation)
    end
end
