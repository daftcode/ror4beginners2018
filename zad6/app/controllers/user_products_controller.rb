class UserProductsController < ApplicationController

  def index
    @products = Customer.find(params[:customer_id]).products
    render 'products/index'
  end

end
