class MembersController < ApplicationController
  before_action :require_user_logged_in
  def index
    @keyword = params[:keyword]
    p @keyword
    if @keyword.present?
      @member = Member.new
      @members = Member.where("lastname like '%"+@keyword+"%'")
                .or(Member.where("firstname like '%"+@keyword+"%'"))
                .or(Member.where("city like '%"+@keyword+"%'"))
                .or(Member.where("streetaddress like '%"+@keyword+"%'"))
                .or(Member.where("tag like '%"+@keyword+"%'"))
                .page(params[:page])
    else
      @member = Member.new
      @members = Member.page(params[:page])
    end
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_url
      #redirect_back(fallback_location: root_path)
    else
      render "new"
    end
  end
  
  def edit
    @member = Member.find(params[:id])
    @family = @member.families.build
    @families = @member.families.rank(:row_order)
    @members = Member.where.not(:id => @member.id).page(params[:page])
    @relationships = @member.member_relashionships.rank(:row_order)
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to edit_member_url(@member)
    else
      render "edit"
    end
  end
  
  def sort
    member = Member.find(params[:id])
    member.update!(member_params)
  end
  
  private

  def member_params
    params.require(:member).permit(:lastname, :firstname, :namekana, :gender,
    :birthday, :postal, :city, :streetaddress, :tel, :mobile, :sect, :kind, :local, :reserve, :dm, :tag, :row_order_position)
  end
end
