class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.all.find(id)
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @owner }
      else
        format.html { render action: 'new' }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    binding.pry
    @appointment = Appointment.all.find(@owner.appointment_id)
    @appointment.address = request.parameters["appointment"]["address"]
    @appointment.city = request.parameters["appointment"]["city"]
    @appointment.description = request.parameters["appointment"]["description"]
    @appointment.save
    @owner.registered = true
    @owner.save
    respond_to do |format|
      if @owner.update(owner_params)
        AppointmentNotify.owner_finalize(@appointment).deliver
        AppointmentNotify.sitter_finalize(@appointment).deliver
        format.html { redirect_to home_path, notice: 'Owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url }
      format.json { head :no_content }
    end
  end

  def confirm
    @owner = Owner.all.find(params[:id])
    @appointment = Appointment.all.find(params[:appointment_id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:name, :email, :phone_number)
    end
end
