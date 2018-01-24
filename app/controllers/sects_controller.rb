class SectsController < ApplicationController
  def index
    @sects = Sect.all
  end
  def create
    @sect = Sect.new(sect_params)
    @sect.save
    redirect_back(fallback_location: root_path)
  end
  
  def update
    @place = Sect.find(params[:id])
    @place.update(sect_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @sect = Sect.find(params[:id])
    @sect.destroy
    redirect_to sects_url
  end

  private
  def sect_params
    params.require(:sect).permit(:sect,:id)
  end
end
