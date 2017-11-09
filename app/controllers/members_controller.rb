class MembersController < ApplicationController
  before_action :require_user_logged_in
  def index
    @member = User.new
  end
  
  def new

  end
end
