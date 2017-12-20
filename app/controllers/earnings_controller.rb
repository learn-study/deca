class EarningsController < ApplicationController
  def create
    @ledger = Ledger.find(params[:ledger_id])
    @er = @ledger.earnings.build(er_params)
    @er.save
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def er_params
    params.require(:earning).permit(:item, :quantity, :price, :taxclass)
  end
end
