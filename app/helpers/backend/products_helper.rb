module Backend::ProductsHelper
  def product_status(product)
    if product.is_online
      "是"
    else
      "否"
    end
  end
end
