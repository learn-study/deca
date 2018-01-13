class DeliverymethodsController < ApplicationController
  def index
    @methods = Deliverymethod.all
  end
  def create
    @method = Deliverymethod.new(method_params)
    @method.save
    redirect_back(fallback_location: root_path)
  end
  
  def update
    @method = Deliverymethod.find(params[:id])
    @method.update(method_params)
    redirect_back(fallback_location: root_path)
  end
  
  private
  def method_params
    params.require(:deliverymethod).permit(:text,:id)
  end
end
