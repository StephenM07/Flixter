class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorize_enrollment
  
  def show
  end

  private

  def require_authorize_enrollment
    @course = current_lesson.section.course
    if current_user.enrolled_in?(@course) != true
      redirect_to course_path(@course), alert: "You need to enroll in the course"
    end
  end


  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
