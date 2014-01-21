class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :get_times, only: [:new]
  # GET /appointments
  # GET /appointments.json

  respond_to :js

  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @owner = Owner.new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @owner_email = request.parameters["owner"]["email"]
    if Owner.email_in_database(@owner_email) && !current_sitter
      return my_action
    else
      @owner = Owner.new(request.parameters["owner"])
      @owner.save
    end
    @appointment = Appointment.new(appointment_params)
    @appointment.save
    # Technically current_owner(if user is signed in)
    if current_sitter
      @appointment.owner_id = current_sitter.id
      @owner.appointment_id = @appointment.id
    else
      @appointment.owner_id = Owner.find_by(:email => "#{@owner_email}").id
    end
    @owner.save
    time_start = @appointment.time_start_convert
    time_end = @appointment.time_end_convert

    # Does this need to be destroyed after I use it?
    session[:available] = Sitter.any_available(time_start, time_end)

    @emails = []
    (session[:available]).each do |key, value|
    @emails << session[:available][key]["email"]
    end
    respond_to do |format|
      if @appointment.save
        AppointmentNotify.new_appointment(@emails, @appointment).deliver
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end 
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment.sitter_id = params["appointment"]["sitter_id"]
    respond_to do |format|
      if @appointment.update(appointment_params)
        AppointmentNotify.owner_notification(@appointment)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  def confirm
    @appointment = Appointment.all.find(params[:id])
    if current_sitter
      @sitter_id = current_sitter.id
    # else
      # alert('Please sign in first')
    end
    
  end

  def sitter_confirm
    
  end  

  def my_action
    respond_to do |format|
      format.js { render :action => "message_function" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :zip_code, :time_start, :time_end)
    end

    def get_times
      @times_array = ["12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM"] 
    end

end
