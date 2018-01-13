class BuddhistsermonsController < ApplicationController
  def new
    if params[:member_id]
      @member = Member.find(params[:member_id])
    end
  end
  
  def index
    @bd = Buddhistsermon.page(params[:page])
  end
  
  def new
    @bd = Buddhistsermon.new
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @bd.city = @member.city
      @bd.member_id = @member.id
    end
    @bd.memorialitems.build
  end
  
  def create
    @bd = Buddhistsermon.new(bd_params)
    @bd.save
    redirect_to edit_buddhistsermon_url(@bd)
  end
  
  def edit 
    @bd = Buddhistsermon.find(params[:id])
    if @bd.member_id
      @member = Member.find(@bd.member_id)
      @bd.city = @member.city
      @bd.member_id = @member.id
    end
  end

  def update
    @bd = Buddhistsermon.find(params[:id])
    @bd.update(bd_params)
    redirect_to edit_buddhistsermon_url(@bd)
  end

  private
  
  def bd_params
    params.require(:buddhistsermon).permit(:member_id,:applicantkana, :applicantfirstname, :applicantlastname,
                            :classification, :employee_id,
                            :orderdate, :deceased, :city, :streetaddress,
                            :ddate, :pardon, :popular, :line, :temple_id, :sect_id,
                            :tel, :mobile, :collection_id, :other,
                            memorialitems_attributes: [:id, :supplier_id, :item_id, :quantity, :price, :amount, :taxation_id,:cost, :total_cost, :cost_taxation_id, :ordering, :derivery_date, :method_id]
                            )
  end
end
