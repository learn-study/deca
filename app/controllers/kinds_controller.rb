class KindsController < ApplicationController
  def index
    @kinds = Kind.all
  end
  
  def create
    begin
      @kind = Kind.new(kind_params)
      @kind.save
      redirect_back(fallback_location: root_path)
    rescue =>e
      flash[:danger] = "登録できませんでした。"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def update
    @place = Kind.find(params[:id])
    @place.update(kind_params)
    redirect_back(fallback_location: root_path)
  end
  
  private
  def kind_params
    params.require(:kind).permit(:id,:text)
  end
end
