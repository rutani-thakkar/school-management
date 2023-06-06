class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :add_student_to_batch]

  def index
    @students = User.where(role: 'student')
  end

  def students_list
    @students = User.where(role: 'student')
    authorize! :students_list, User
  end

  def school_admin_list
      @school_admins = User.where(role: 'school-admin')
      authorize! :school_admin_list, User
    end

  def show
    @batches = @user.school.batches
    authorize! :show, @user
  end

  def new
    authorize! :new, User
    @school_admin = params[:school_admin]
    @user = User.new
  end

  def create_student
    authorize! :create_student, User
    @user = User.new(user_params)
    @user.school = current_user.school
    @user.role = 'student'
    if @user.save
      redirect_to students_list_users_path, notice: 'User created successfully!'
    else
      render new_user_path, alert: @user.errors.full_messages.join(', ')
    end
  end

  def create_school_admin
      authorize! :create_school_admin, User
      @school_admin = User.new(school_admin_params)
      @school_admin.role = 'school-admin'
      if @school_admin.save
        redirect_to school_admin_list_users_path, notice: 'School Admin created successfully!'
      else
        render new_user_path, alert: @school_admin.errors.full_messages.join(', ')
      end
  end

  def add_student_to_batch
    batch = Batch.find(params[:batch_id])
    @user.enrollments.create!(batch_id: batch.id, status: :Accepted)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :role, :password)
  end

  def school_admin_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :role, :school_id, :password)
    end

  def find_user
    @user = User.find(params[:id])
  end
end
