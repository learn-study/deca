class SectsController < ApplicationController
  def create
    @sect = Sect.new(sect_params)
    @sect.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  def sect_params
    params.require(:sect).permit(:sect)
  end
end
