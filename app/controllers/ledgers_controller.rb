class LedgersController < ApplicationController
  def itemsort
    supplier = Supplier.find(params[:val])
    @num= params[:num]
    p @num
    @result = supplier.items
  end
  
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
    costs
    redirect_to @ledger
  end

  def show
    @ledger  = Ledger.find(params[:id])
    if @ledger.member_id.present?
      @member = Member.find(@ledger.member_id)
    end
    @earning = Earning.new
    @earnings = @ledger.earnings.rank(:row_order)
    @costs   = @ledger.costs.rank(:row_order)
  end
 
  def edit 
    @ledger = Ledger.find(params[:id])
    if @ledger.member_id.present?
      @member = Member.find(@ledger.member_id)
    end
    @earning = Earning.new
    @eanings= @ledger.earnings
    @costs   = @ledger.costs
  end

  def update
    @ledger = Ledger.find(params[:id])
    @ledger.update(ledger_params)
    costs
    redirect_to @ledger
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
  
  def costs
    total_c = 0
    total_e = 0
    @ledger.costs.each do |c|
      total_c += c.quantity * c.price if c.quantity.present? && c.price.present?
    end
    @ledger.earnings.each do |e|
      total_e += e.price * e.quantity if e.price.present? && e.quantity.present?
    end
    @ledger.update(total_cost: total_c,total_amount: total_e)
  end
end
