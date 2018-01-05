class CeremonialplacesController < ApplicationController
  def index
    @place = Ceremonialplace.all
  end
  def create
    begin
      @place = Ceremonialplace.new(place_params)
      @place.save
      redirect_to ceremonialplaces_path
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to ceremonialplaces_path
    end
  end
  
  def update
    @place = Ceremonialplace.find(params[:id])
    @place.update(place_params)
    redirect_to ceremonialplaces_path
  end
  
  private
  def place_params
    params.require(:ceremonialplace).permit(:id, :tel, :name, :address)  
  end
end
