class AltarsController < ApplicationController

  def new
    if params[:member_id]
      @member = Member.find(params[:member_id])
    end
  end
  
  def index
    @altars = Altar.page(params[:page])
  end
  
  def new
    @altar = Altar.new
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @altar.city = @member.city
      @altar.member_id = @member.id
    end
    @altar.altaritems.build
  end
  
  def create
    @altar = Altar.new(altar_params)
    @altar.save
    redirect_to edit_altar_url(@altar)
  end
  
  def edit 
    @altar = Altar.find(params[:id])
    if @altar.member_id
      @member = Member.find(@altar.member_id)
      @altar.city = @member.city
      @altar.member_id = @member.id
    end
  end

  def update
    @altar = Altar.find(params[:id])
    @altar.update(altar_params)
    redirect_to edit_altar_url(@altar)
  end

  private
  
  def altar_params
    params.require(:altar).permit(:member_id,:applicantkana, :applicantfirstname, :applicantlastname,
                            :classification, :employee_id,
                            :orderdate, :deceased, :city, :streetaddress,
                            :ddate, :pardon, :popular, :line, :temple_id, :sect_id,
                            :tel, :mobile, :collection_id, :other,
                            altaritems_attributes: [:id, :supplier_id, :item_id, :quantity, :price, :amount, :taxation_id,:cost, :total_cost, :cost_taxation_id, :ordering, :derivery_date, :method_id]
                            )
  end
end
