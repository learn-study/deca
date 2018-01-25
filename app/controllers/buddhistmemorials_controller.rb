class BuddhistmemorialsController < ApplicationController
  def index
    @buddhistmemorial = Buddhistmemorial.all
  end
  
  def create
    begin
      @buddhistmemorial = Buddhistmemorial.new(buddhistmemorial_params)
      @buddhistmemorial.save
      redirect_to buddhistmemorials_url
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to buddhistsermons_url
    end
  end
  
  def update
    @buddhistmemorial = Buddhistmemorial.find(params[:id])
    @buddhistmemorial.update(buddhistmemorial_params)
    redirect_to buddhistmemorials_url
  end
  
  private
  def buddhistmemorial_params
    params.require(:buddhistmemorial).permit(:id, :name)  
  end
end
