class CoursesController < ApplicationController
    before_action :initialize_session
    before_action :load_cart
      def home
       @courses=Course.all
      end 
      def add_to_cart
       id=params[:id].to_i
       session[:cart] << id unless session[:cart].include?(id)
       redirect_to course_path(id)
      end
      def remove_from_cart
       id=params[:id].to_i
       session[:cart].delete(id)
       redirect_to root_path
      end
      def initialize_session
       session[:cart] ||=[]
      end 
      def load_cart
       @cart=Course.find(session[:cart])
      end 

       def index
       @courses=Course.all
       if user_signed_in?
        @enroll=Enrollment.where(user_id: current_user.id).distinct.to_a
        @courses=Course.all
        @reqcourse=[]
        for i in @enroll
          for j in @courses
           if j.id==i.course_id
            @reqcourse.push(j)
           end
          end
        end
        if current_user.user_role.downcase == "instructor"
          @usercourse=Course.where(user_id: current_user.id).to_a
        end 
       end
      #  @course=Course.find(3)
      #  @instructor=Instructor.find(@course.instructor_id)
       # @user=User.find(params[:id])
      end
      def show  
       @course=Course.find(params[:id])#1
       @videos=@course.videos        
       if user_signed_in?
       #  CartsController.addtocart(@course.id)#editted 
        @enroll=Enrollment.where(user_id: current_user.id).distinct.to_a
        @reqcourse=[]
        @allcourseid=[]
        for i in @enroll
           if @course.id==i.course_id
            @reqcourse.push(@course.id)
           end
        end
       end
       @instructor=User.find(@course.user_id)
       
      end
      def new
       @course=Course.new
      end
      def edit
       @course=Course.find(params[:id])
      end
      def update
       @course = Course.find(params[:id])
       if @course.update(course_params)
         redirect_to @course
       else
         render :edit
       end
      end
      def create
       # @course = Course.new(course_params)
      #  @inst = Instructor.find(params[:id])
       @course = Course.create(course_params)
       #@instructor.course=create_course_path(@instructors)
       if @course.save
         redirect_to @course
       else
         render :new
       end
     end
      def destroy
       @course=Course.find(params[:course_id])
       @course.destroy
       redirect_to root_path
      end
      private
       def course_params
         params.require(:course).permit(:course_name, :description, :total_videos, :duration, :cost,:category, :user_id,)
       end
       
end
