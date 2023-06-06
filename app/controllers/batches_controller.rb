class BatchesController < ApplicationController
  before_action :authorize_batch, except: [:index, :enroll_batch, :show]
  before_action :find_batch, only: [:show, :edit, :update, :destroy, :enroll_batch, :discard_enrolled_batch]
  before_action :find_course, only: [:new, :create, :index, :enroll_batch, :discard_enrolled_batch, :destroy]

  def index
    @batches = @course.batches
    authorize! :index, Batch
  end

  def show
    authorize! :show, @batch
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    if @batch.save!
      redirect_to course_batches_path(course_id: @course.id), notice: 'Batch created successfully!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @batch.update(batch_params)
      redirect_to batch_path(@batch), notice: 'Batch updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @batch.destroy
    redirect_to course_batches_path(@course), notice: 'Batch destroyed successfully!'
  end

  def enroll_batch
    current_user.enrollments.create!(batch_id: @batch.id, status: :Requested)
    redirect_to course_batches_path(@course)
    authorize! :enroll_batch, Batch
  end

  private

  def authorize_batch
    authorize! :manage, Batch
  end

  def batch_params
    params.require(:batch).permit(:name, :description, :capacity, :start_date, :end_date, :course_id)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_batch
    @batch = Batch.find(params[:id])
  end

end
