class SittersController < ApplicationController
  

  def index
    @sitters = Sitter.all
  end



end
