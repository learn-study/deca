class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end
  
    def create
    begin
      @collection = Collection.new(collection_params)
      @collection.save
      redirect_to collections_path
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to collections_path
    end
  end
  
  def update
    @collection = Collection.find(params[:id])
    @collection.update(collection_params)
    redirect_to collections_path
  end
  
  private
  def collection_params
    params.require(:collection).permit(:id, :text)  
  end
end

