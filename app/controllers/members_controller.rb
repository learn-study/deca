class MembersController < ApplicationController
  before_action :require_user_logged_in
  def index
    @member = Member.new
    @members = Member.all
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
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to members_url
    else
      render "edit"
    end
  end
  private

  def member_params
    params.require(:member).permit(:name, :namek,
    :address1, :address2, :tel, :sect, :kind, :text)
  end
end
