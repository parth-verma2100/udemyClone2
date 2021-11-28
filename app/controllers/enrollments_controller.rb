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
     #@course=Course.find(params[:id])  #current course id
     #@user=current_user # current user logged
     #if couseid present in current user
    #then print Already Enrolled
    #else create enrollment
    #flash msg
    #carrier wave
    #1- If user ne course enrool krdia to dont show in all course
    #2- Do the validation if user id and course id already exist
    #3-If course is showing the show that go to course...
     @course=Course.find(params[:id])
     @enroll =Enrollment.create(watched_videos:@course.total_videos,user_id: current_user.id,  course_id: @course.id)#current assignment for enrollment 
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
