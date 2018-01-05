class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end
  def create
    begin
      @supplier = Supplier.new(place_params)
      @supplier.save
      redirect_to suppliers_path
    rescue => e
      flash[:danger] = "登録できませんでした。"
      redirect_to suppliers_path
    end
  end
  
  def update
    begin
      @supplier = Supplier.find(params[:id])
      @supplier.update(supplier_params)
      flash[:success] = @supplier.name+ "を編集しました。"
    redirect_to suppliers_path
    rescue => e
      flash[:danger] = "その編集は受け付けられません。"
      redirect_to suppliers_path
    end
  end
  
  private
  def supplier_params
    params.require(:supplier).permit(:id, :name, :tax)  
  end
end
