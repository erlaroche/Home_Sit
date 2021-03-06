class AppointmentsController < ApplicationController

  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :get_times, only: [:new]
  # GET /appointments
  # GET /appointments.json
  
  # respond_to :js

  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    # If owner signed in, use session_id
    @available = []
    @owner = Owner.new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @owner = Owner.register(request.parameters)
    @appointment = Appointment.new(appointment_params)
    if @appointment.save && @owner.save
      @appointment.owner_id = @owner.id
      @owner.appointment_id = @appointment.id
      @appointment.save
      @owner.save
      time_start = @appointment.time_start_convert
      time_end = @appointment.time_end_convert
      # Does this need to be destroyed after I use it?
      @available = Sitter.any_available(time_start, time_end)

      @emails = []
      @available.each do |key, value|
        @emails << @available[key]["email"]
      end
      # AppointmentNotify.new_appointment(@emails, @appointment).deliver
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
        format.js {render :layout => false}
      end
    else
      get_times
      respond_to do |format|
      format.html { render action: 'new' }
      format.json { render json: @appointment.errors, status: :unprocessable_entity }
    end
  end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params["appointment"]["appointment_id"])
    @sitter_id = params["appointment"]["sitter_id"]
    if @sitter_id
      @appointment.sitter_id = @sitter_id
    else
      @appointment.back_up_sitter_id = params["appointment"]["back_up_sitter_id"]
    end
    respond_to do |format|
      if @appointment.save
        AppointmentNotify.owner_notification(@appointment).deliver if @sitter_id
        format.html { redirect_to home_path, notice: 'Appointment was successfully updated.' }
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
    if session[:sitter_id]
      @sitter = Sitter.all.find(session[:sitter_id])
      @sitter_id = @sitter.id
    else
      session[:return_to] ||= request.original_url
    end
    
  end

  def back_up_confirm
    @appointment = Appointment.all.find(params[:id])
    if session[:sitter_id]
      @sitter = Sitter.all.find(session[:sitter_id])
      @sitter_id = @sitter.id
    else
      session[:return_to] ||= request.original_url
    end
  end

  def get_pictures
    @appointment = Appointment.new
    @appointment.time_start = params["time_start"]
    @appointment.time_end = params["time_end"]
    @appointment.date = params["date"]
    @appointment.time_start_convert
    @appointment.time_end_convert
    time_start = @appointment.time_start_convert
    time_end = @appointment.time_end_convert
      # Does this need to be destroyed after I use it?
    @available = Sitter.any_available(time_start, time_end)
    respond_to do |format|
      format.js {render :layout => false}
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
