class Admin::DashboardController < ApplicationController
  def show
  
    @inventory = Product.sum(:quantity)
    
    @category = Category.count()
  end
end
