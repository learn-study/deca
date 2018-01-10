class OfficersController < ApplicationController
  def create
    @enforce = Enforcement.find(params[:officer][:enforcement_id])
    @officer = @enforce.officers.create(officer_params)
    
    redirect_to edit_enforcement_url(@enforce)
  end
  
  def update
    @officer = Officer.find(params[:id])
    @officer.update(officer_params)
    
    redirect_to edit_enforcement_url(@enforce)
  end
  
  def officer_params
    params.require(:officer).permit(:enforcement_id,:supplier_id,:receptionist, :accounting, :reception,
                                    :moderator, :parking, :other)
  end
end
