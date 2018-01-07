class ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page])
  end
  
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
    @report.name = @report.lastname.gsub(/(\s|　)+/, '')+@report.firstname.gsub(/(\s|　)+/, '')
    @report.save
    redirect_to edit_report_url(@report)
  end
  
  def edit 
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.name = @report.lastname.gsub(/(\s|　)+/, '')+@report.firstname.gsub(/(\s|　)+/, '')
    @report.update(report_params)
    redirect_to edit_report_url(@report)
  end

  private
  
  def report_params
    params.require(:report).permit(:member_id, :classification, :employee_id,
                            :orderdate, :deliverydate, :payment,
                            :name, :namekana, :firstname, :lastname,
                            :deceased, :city, :streetaddress,
                            :tel, :mobile, :collection_id, :other
                            )
  end
end
