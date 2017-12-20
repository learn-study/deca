class CostsController < ApplicationController
  def create
    @ledger = Ledger.find(params[:ledger_id])
    @cost = @ledger.costs.build(cost_params)
    @cost.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def cost_params
    params.require(:cost).permit(:item, :quantity, :price, :supplier)
  end
end
