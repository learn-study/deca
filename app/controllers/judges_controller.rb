class JudgesController < ApplicationController
  def index
  end
  def new
    if params[:member_id]
      @member = Member.find(params[:member_id])
    end
  end
end
