class EnrollmentsController < ApplicationController
  before_action :authorize_enrollment
  def index
    batch_ids = current_user.school.batches.pluck(:id)
    @enrollments = Enrollment.where(status: 'Requested', batch_id: batch_ids)
  end

  def accept_request
    @enrollment  = Enrollment.find(params[:id])
    @enrollment.update(status: :Accepted)
    redirect_to enrollments_path, notice: 'Enrollment accepted successfully!'
  end

  def denied_request
    @enrollment  = Enrollment.find(params[:id])
    @enrollment.update(status: :Denied)
    redirect_to enrollments_path, notice: 'Enrollment denied successfully!'
  end

  private
  def authorize_enrollment
    authorize! :manage, Enrollment
  end
end
