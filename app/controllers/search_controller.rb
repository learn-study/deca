class SearchController < ApplicationController
  def altar
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @num = params[:num]
    @tax = supplier.tax
  end
  
  def report
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @num = params[:num]
    @tax = supplier.tax
  end
  
  def bd
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @num = params[:num]
    @tax = supplier.tax
  end
  def itemreport
    @item = Item.find(params[:val])
    @num = params[:num]
  end
  def itemaltar
    @item = Item.find(params[:val])
    @num = params[:num]
  end
  def itembd
    @item = Item.find(params[:val])
    @num = params[:num]
  end
end


