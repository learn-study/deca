class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end
  
  def create
    begin
      @destination = Destination.new(destination_params)
      @destination.save
      redirect_to destinations_url
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to destinations_url
    end
  end
  
  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    redirect_to destinations_url
  end
  
  private
  def destination_params
    params.require(:destination).permit(:id, :name)  
  end
end
