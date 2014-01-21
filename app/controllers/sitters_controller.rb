class SittersController < ApplicationController
  

  def new
    @sitter = Sitter.all.find(params[:id])
  end

  def update
    @sitter = Sitter.all.find(params[:id])
    @sitter.phone_number = params["sitter"]["phone_number"]
    @sitter.zip_code = params["sitter"]["zip_code"]

    respond_to do |format|
      if @sitter.save
        format.html { redirect_to home_path, notice: 'Sitter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sitter }
      else
        format.html { render action: 'new' }
        format.json { render json: @sitter.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @sitters = Sitter.all
  end



end
