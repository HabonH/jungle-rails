# Display a count of how many products are in the database
# Display a count of how many categories are in the database
class Admin::DashboardController < ApplicationController
  def show
    @product_total = Product.count
    @category_total = Category.count
    
  end
end
