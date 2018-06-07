class UserController < ApplicationController
  def index
 		@user = current_user
    @orders = Order.where("user_id LIKE ?", "%#{@user.id}%")
    @products = Product.all
 	end
end
