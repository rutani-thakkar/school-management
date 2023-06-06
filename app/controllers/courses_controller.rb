class CoursesController < ApplicationController
  before_action :authorize_course, except: [:show]
  before_action :find_school, only: [:new, :create, :destroy]
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    authorize! :show, @course
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save!
      redirect_to school_path(@school), notice: 'course created successfully!'
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_path(@course), notice: 'course ,updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to school_path(@school), notice: 'Course destroyed successfully!'
  end

  private

  def authorize_course
    authorize! :manage, Course
  end

  def course_params
    params.require(:course).permit(:name, :description, :duration, :start_date, :end_date, :school_id)
  end

  def find_school
    @school = School.find(params[:school_id])
  end

end
