class ProductsController < ApplicationController
  def index
  	@customer ||= Customer.find_by!(id: params[:customer_id])
  	@products = @customer.products.sorted.lower_than(price_param)
  end

  private

  def price_param
  	!!params[:price] ? params[:price] : ''
  end
end
