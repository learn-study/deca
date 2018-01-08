class TaxationsController < ApplicationController
  def index
    @taxs = Taxation.all
  end
  def create
    begin
      @tax = Taxation.new(tax_params)
      @tax.save
      redirect_to taxations_path
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to taxations_path
    end
  end
  
  def update
    @tax = Taxation.find(params[:id])
    @tax.update(tax_params)
    redirect_to taxations_path
  end
  
  private
  def tax_params
    params.require(:taxation).permit(:id, :text)  
  end
end
