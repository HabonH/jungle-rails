class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @category = Category.all
    @product = Product.all
    @product_total = Product.count
    @category_total = Category.count
    
  end
end
