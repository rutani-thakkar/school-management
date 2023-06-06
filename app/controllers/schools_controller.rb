class SchoolsController < ApplicationController
  before_action :find_school, only: [:show, :edit, :update, :destroy]

  def index
    @schools = School.all
  end

  def show
    @courses = @school.courses
  end

  def new
    @school = School.new
    authorize! :create, @school
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school, notice: 'School created successfully!'
    else
      render :new, notice: 'Failed to create user.'
    end
  end

  def edit
    authorize! :edit, @school
  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_url, notice: 'School destroyed successfully!'
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :email, :phone, :website, :description)
  end

  def find_school
    @school = School.find(params[:id])
  end
end
