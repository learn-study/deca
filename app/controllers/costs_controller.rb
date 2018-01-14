class CostsController < ApplicationController
  def sort
    cost = Cost.find(params[:id])
    cost.update(cost_params)
    render nothing: true
  end
  
  
  private
  def cost_params
     params.require(:cost).permit(:item, :quantity,:price,:total,:supplier,:ledger_id, :row_order_position)
  end
end
