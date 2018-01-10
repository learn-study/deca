class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.page(params[:page])
  end
  
  def new
    @ledger = Ledger.new
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @ledger.member_id = @member.id
    end
    @ledger.costs.build
    @ledger.earnings.build
  end
  
  def create
    @ledger = Ledger.create(ledger_params)
    redirect_to edit_ledger_url(@ledger)
  end
  
  def edit 
    @ledger = Ledger.find(params[:id])
    @cost = Cost.new
    @earning = Earning.new
    @eanings= @ledger.earnings
    @costs   = @ledger.costs
  end

  def update
    @ledger = Ledger.find(params[:id])
    @ledger.update(ledger_params)
    redirect_to edit_ledger_url(@ledger)
  end

  private
  
  def ledger_params
    params.require(:ledger).permit(:home, :classification,
                            :employee_id, :kind_id, :member_id,
                            :deceased, :coffin, :other,
                            :applicantlastname,:applicantfirstname,:applicantkana,:applicantname,
                            costs_attributes: [:item, :quantity, :price, :total, :supplier, :id],
                            earnings_attributes: [:item, :quantity, :price, :total, :taxclass, :id])
  end
end
