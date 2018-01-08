class EnforcementsController < ApplicationController
  def index
    @enforces = Enforcement.page(params[:page])
  end
  
  def new
    @enforce= Enforcement.new
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @enforce.city = @member.city
      @enforce.member_id = @member.id
      @enforce.streetaddress = @member.streetaddress
    end
  end

  def create
    @enforce= Enforcement.new(en_parms)
    @enforce.save
    redirect_to edit_enforcement_url(@enforce)
  end

  def edit
    @enforce = Enforcement.find(params[:id])
    if @enforce.member_id.present?
      @member = Member.find(@enforce.member_id)
    end
  end
  
  def update
    @enforce = Enforcement.find(params[:id])
    @enforce.update(en_parms)
    redirect_to edit_enforcement_url(@enforce)
  end
  
  private
  def en_parms
    params.require(:enforcement).permit(:family_name, :member_id,
                                       :classification, :kind_id, :employee_id,
                                       :deceased, :birthday, :ddate,
                                       :cliefmaster, :relationship, :constructor,
                                       :city, :streetaddress, :tel, :mobile,
                                       :plan, :total, :wake, :funeral, :coffin,
                                       :ceremonial_id, :royarity, :burdon, :ucosts,
                                       :temple_id, :number_of_pepole, :letter_price,
                                       :letter_quantity, :letter_supplier_id, :refreshment_price,
                                       :refreshment_quantity, :refreshment_supplier_id, :refreshment_product_id,
                                       :gift_price,:gift_quantity, :gift_supplier_id, :gift_product_id,
                                       :nightwear_price,:nightwear_quantity, :nightwear_supplier_id,
                                       :bus_price,:bus_quantity, :bus_supplier_id,:r_bus, :other
                                        )
  end
end
