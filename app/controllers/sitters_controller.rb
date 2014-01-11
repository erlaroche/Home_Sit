class SittersController < ApplicationController
  

  def show
  end

  def index
  end

  def destroy
  end

  def create
    @sitter = Sitter.new(sitter_params)

    respond_to do |format|
      if @sitter.save
        format.html { redirect_to @sitter, notice: 'Sitter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sitter }
      else
        format.html { render action: 'new' }
        format.json { render json: @sitter.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def new
    @sitter = Sitter.new
  end

  private

  def sitter_params
    params[:sitter].permit(:name, :email, :phone_number, :attachment, :zip_code, :password)
  end

end
