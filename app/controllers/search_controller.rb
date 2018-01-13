class SearchController < ApplicationController
  def altar
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @number = params[:number].to_i / 8
    @num= (@number * 12) +1
  end
  
  def report
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @number = params[:number].to_i / 8
    @num= (@number * 12) +1
  end
  
  def bd
    supplier = Supplier.find(params[:val])
    @result = supplier.items
    @number = params[:number].to_i / 8
    @num= (@number * 12) +1
  end
end


