class RemarksController < ApplicationController
  def create
    member = Member.find(params[:member_id])
    @remark = member.remarks.build(remark_params)
    @remark.date = params[:remark][:date]
    @remark.save
    redirect_back(fallback_location: root_path)
  end
  
  private

  def remark_params
    params.require(:remark).permit(:date,:content)
  end
end
