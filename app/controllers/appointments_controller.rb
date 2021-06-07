# frozen_string_literal: true

class AppointmentsController < InheritedResources::Base
  load_and_authorize_resource

  before_action :set_appointment, only: %i[show update destroy]
  before_action :set_category
  before_action :authenticate_user!

  def index
    @appointments = @category.appointments.limit(10).where(closed: false)
  end

  def new
    @appointment = Appointment.new(parent_id: params[:parent_id])
  end

  def create
    @appointment = @category.appointments.build(appointment_params)
    @appointment.user = current_user
    @appointment.save
    redirect_to category_path(@category)
  end

  def update
    if @appointment.update(appointment_params)
      flash[:success] = 'appointment was updated'
      redirect_to appointment_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
    end
  end

  def destroy
    if @appointment.destroy.destroyed?
      flash[:success] = 'appointment was deleted'
      redirect_to appointments_path
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def appointment_params
    params.require(:appointment).permit(:body, :closed, :category_id, :parent_id)
  end
end
