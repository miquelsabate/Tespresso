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
    @no_orders = true
    @orders.each do |t|
      if t.state == "Carrito"
        @no_orders = false
      end
    end
 	end
end
