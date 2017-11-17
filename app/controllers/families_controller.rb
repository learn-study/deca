class FamiliesController < ApplicationController
  def create
    @member = Member.find(params[:member_id])
    @family = @member.families.build(family_params)
    if @family.save
      redirect_to edit_member_url(@member)
    else
      render "member/edit"
    end
  end
  
  def update
    @family = Family.find(params[:id])
    @family.update(family_params)
    redirect_back(fallback_location: root_path)
  end
  
  def sort
    family = Family.find(params[:id])
    family.update!(family_params)
  end
  
  private
  
  def family_params
    params.require(:family).permit(:separately, :relationship, :lastname, :firstname, :namekana, :gender,
    :birthday, :postal, :city, :streetaddress, :dm, :row_order_position)
  end
end
