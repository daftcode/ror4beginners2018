class ProductsController < ApplicationController
  def index
    @products = params.key?(:price) ? Product.cheaper_than(params[:price]) : Product.all
  end
end
