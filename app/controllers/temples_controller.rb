class TemplesController < ApplicationController
  def index
    @temples = Temple.all
  end
  def create
    begin
      @temple = Temple.new(temple_params)
      @temple.save
      redirect_to temples_path
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to temples_path
    end
  end
  
  def update
    @temple = Temple.find(params[:id])
    @temple.update(temple_params)
    redirect_to temples_path
  end
  
  private
  def temple_params
    params.require(:temple).permit(:id, :tel, :name, :address)  
  end
end
