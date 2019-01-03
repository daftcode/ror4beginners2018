module ProductsHelper

  def filter_price(products, filter)
    logger.info products.select {|p| p.price<filter.to_i}
    products.select {|p| p.price<filter.to_i}
  end

end
