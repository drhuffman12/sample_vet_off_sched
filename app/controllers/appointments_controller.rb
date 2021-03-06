class AppointmentsController < ApplicationController
  # before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # before_action :authenticate_user!
  load_and_authorize_resource

  def pets_per_user
    begin
      @pet_owners = Pet.pet_owners
      @user = @pet_owners.where(id: params[:appointment_user_id]).first
      @pets = (@user ? @user.pets : nil)
    rescue
      @pets = nil
    end
  end

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.order('date_of_visit DESC, user_id, pet_id')
    @appointments = @appointments.where(user_id: current_user.id) unless current_user.ability.can? :manage, Appointment
    @appointments = @appointments.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    # @appointment = Appointment.new
    current_user_and_pets
  end

  # GET /appointments/1/edit
  def edit
    current_user_and_pets
  end

  def current_user_and_pets
    @pet_owners = Pet.pet_owners
    @user = @pet_owners.where(id: @appointment.user_id).first
    @pets = (@user ? @user.pets : nil)
  end

  # POST /appointments
  # POST /appointments.json
  def create
    # @appointment = Appointment.new(appointment_params)
    current_user_and_pets

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_appointment
    #   @appointment = Appointment.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:user_id, :pet_id, :date_of_visit, :reminder, :reason)
    end
end
