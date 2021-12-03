class VideosController < ApplicationController
    def index
      @course=Course.find(params[:course_id])
      @videos=@course.videos
    end
    def new
      @course=Course.find(params[:course_id])
      @video = @course.videos.new
    end
    def edit
      @course=Course.find(params[:course_id])
      @video=@course.videos.find(params[:id])
    end
    def show
      @course=Course.find(params[:course_id])
      @video=@course.videos.find(params[:id])
    end
    def create
        @course=Course.find(params[:course_id])
        @video = @course.videos.create(video_params)
        # session[:course_id] = @course.id
        if @video.save
         redirect_to course_path(@course)
        end
    end
    def update
        @course=Course.find(params[:course_id])
        @video = @course.videos.find(params[:id])
        @video.update_attributes(video_params)
        @video = current_course.videos
        redirect_to @video
    end
    
    def destroy
      @course = Course.find(params[:course_id])
      @video = @course.videos.find(params[:id])
      @video.destroy
      redirect_to course_path(@course)
      # @video = current_course.videos
    end
    private
      def video_params
        params.require(:video).permit(:title,:url,:course_id)
      end
    
      def set_order
        @course = current_course
      end
end
