class ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page])
  end
  
  def new
    @report = Report.new
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @report.city = @member.city
      @report.member_id = @member.id
      #@report.streetadress = @member.streetaddress
    end
    @report.deliverables.build
  end
  
  def create
    @report = Report.new(report_params)
    @report.save
    costs
    redirect_to edit_report_url(@report)
  end
  
  def edit 
    @report = Report.find(params[:id])
    if @report.member_id
      @member = Member.find(@report.member_id)
      @report.city = @member.city
      @report.member_id = @member.id
      #@report.streetadress = @member.streetaddress
    end
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    costs
    redirect_to edit_report_url(@report)
  end

  private
  
  def report_params
    params.require(:report).permit(:member_id, :classification, :employee_id,
                            :orderdate, :deliverydate, :payment,
                            :applicantkana, :applicantfirstname, :applicantlastname,
                            :deceased, :city, :streetaddress,
                            :tel, :mobile, :collection_id, :other,
                            deliverables_attributes: [:id, :supplier_id, :item_id, :quantity, :price, :amount, :taxation_id,
                            :cost, :total_cost, :cost_taxation_id, :ordering, :derivery_date, :method_id]
                            )
  end
  def costs
    total_fee = 0
    total_cost = 0
    begin
      @report.deliverables.each do |d|
        kingaku = d.quantity * d.price
        genkaga = d.quantity * d.cost
        d.update(amount:kingaku,total_cost:genkaga)
        total_fee += kingaku
        total_cost += genkaga
      end
      @report.update(total_fee: total_fee,total_cost: total_cost)
    rescue => e
      
    end
  end
end
