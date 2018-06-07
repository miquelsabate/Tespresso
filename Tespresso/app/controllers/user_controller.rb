class UserController < ApplicationController
  def index
 		@user = current_user
    @orders = Order.where("user_id LIKE ?", "%#{@user.id}%").order("id DESC")
    @products = Product.all
 	end

  def cart
 		@user = current_user
    @orders = Order.where("user_id LIKE ?", "%#{@user.id}%")
    @products = Product.all
 	end
end
