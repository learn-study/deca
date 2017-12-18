class FamiliesController < ApplicationController
  def create
    @member = Member.find(params[:member_id])
    @family = @member.families.build(family_params)
    @family.name = @family.lastname.gsub(/(\s|　)+/, '')+@family.firstname.gsub(/(\s|　)+/, '')
    p @family.inspect
    @members = Member.where.not(:id => @member.id).page(params[:page])
    if @family.save
      redirect_to edit_member_url(@member)
    else
      redirect_to edit_member_url(@member)
      flash[:danger] = "家族追加に失敗しました。"
    end
  end

  def edit
    @family=Family.find(params[:id])
  end
  
  def update
    @family = Family.find(params[:id])
    @family.name = @family.lastname.gsub(/(\s|　)+/, '')+@family.firstname.gsub(/(\s|　)+/, '')
    @family.update(family_params)
    redirect_to edit_member_url(@family.member)
    #redirect_back(fallback_location: root_path)
  end
  
  def sort
    family = Family.find(params[:id])
    family.update!(family_params)
  end
  
  private
  
  def family_params
    params.require(:family).permit(:separately, :relationship, :lastname, :firstname, :namekana, :gender,
    :birthday, :postal, :city, :streetaddress, :dm, :note, :row_order_position)
  end
end
