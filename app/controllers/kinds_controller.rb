class KindsController < ApplicationController
  def create
    @kind = Kind.new(sect_params)
    @kind.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  def sect_params
    params.require(:kind).permit(:text)
  end
end
