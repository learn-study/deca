class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def create
    begin
      @item = Ceremonialplace.new(item_params)
      @item.save
      redirect_to items_path
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to items_path
    end
  end
  
  def update
    @item = Ceremonialplace.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end
  
  private
  def place_params
    params.require(:item).permit(:id, :name, :sell, :cost)  
  end
end
