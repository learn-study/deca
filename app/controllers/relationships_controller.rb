class RelationshipsController < ApplicationController
  def create
    @member = Member.find(params[:member_id])
    @relation = @member.relations.find_or_initialize_by(member_id: params[:r_id])
    @relation.text = params[:relationship][:text] 
    @relation.save!
    redirect_back(fallback_location: root_path)
  end
  private
  def relation_params
    params.require(:relationship).permit(:text)
  end
end
