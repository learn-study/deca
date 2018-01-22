class SearchController < ApplicationController
  def altar
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @number = params[:number].to_i / 8
    @tax = supplier.tax
  end
  
  def report
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @number = params[:number].to_i / 8
    @tax = supplier.tax
  end
  
  def bd
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @number = params[:number].to_i / 8
    @tax = supplier.tax
  end
end


