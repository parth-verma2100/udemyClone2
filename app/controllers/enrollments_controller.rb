class EnrollmentsController < ApplicationController
    def index
     @enrolls=Enrollment.all
    end
    def show
     @enroll=Course.find(params[:id])
    end
    def new
     @enroll=Enrollment.new
    end
    def edit
     @enroll=Enrollment.find(params[:id])
    end
    def update
     @enroll = Enrollment.find(params[:id])
     if @enroll.update(enroll_params)
       redirect_to @enroll
     else
       render :edit
     end
    end
    def create
     @course=Course.find(params[:id])
     @enroll =Enrollment.create(watched_videos:@course.total_videos,user_id: current_user.id,  course_id: @course.id)
     if @enroll.save
       redirect_to root_path
     else
       render :new
     end
    end
    def destroy
     @enroll=Enrollment.find(params[:id])
     @enroll.destroy
     redirect_to root_path
    end
    private
     def enroll_params
       params.require(:enrollment).permit(:watched_videos,:user_id,:course_id)
     end
end
