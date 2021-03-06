class Admin::ClassroomsController < Admin::Base
    
    def index
        @classrooms=Classroom.all.order(:id).reverse_order.page(params[:page]).per(10)
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
            redirect_to("/admin/classrooms")
        else
            flash[:alert]="追加できませんでした。"
            render("classroom#new")
        end
    end

    def edit

    end

    def update

    end

    def destroy
        @classroom=Classroom.find(params[:id])
       if @classroom.destroy
        flash[:notice]="教室を削除しました"
       else
        flash[:alert]="教室を削除できませんでした"
       end
       redirect_to("/admin/classrooms")

    end
    
    def classroom_params
        params.require(:classroom).permit(:name)
    end

end
