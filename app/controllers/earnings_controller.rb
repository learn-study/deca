class EarningsController < ApplicationController
  def sort
    er = Earning.find(params[:id])
    er.update(er_params)
    render nothing: true
  end

  private
  
  def er_params
    params.require(:earning).permit(:item, :quantity, :price,:total, :taxclass, :ledger,:row_order_position)
  end
end