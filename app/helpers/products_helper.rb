module ProductsHelper
  # nstead of using cache @products in your index.html.erb file, you can also use a custom
  # helper method to specify what should be cached and when it expires.
  #create a custom helper method that checks the amount of products and whether one has been updated.
  def cache_key_for_products
    count          = Product.count
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end
end
