class RelationshipsController < ApplicationController
  def create
    @member = Member.find(params[:member_id])
    @relationships = @member.relationships.find_or_initialize_by(member2_id: params[:r_id])
    @relationships.text = params[:relationship][:text] 
p "#{@relation.inspect}@@@@@@@@@@@@@@@@@"
    @relationships.save!
    redirect_back(fallback_location: root_path)
  end
  private
  def relation_params
    params.require(:relationship).permit(:text)
  end
end
