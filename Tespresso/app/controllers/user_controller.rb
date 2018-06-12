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

  def edit
    @user = current_user
  end

  def modify
    @user = current_user
    if params[:name] != ""
      @user.name = params[:name]
    end
    if params[:email] != ""
      @user.direction = params[:direction]
    end
    if params[:numcard] != ""
      @user.numcard = params[:numcard]
    end

    if @user.save
      redirect_to "/user"
    end
  end
end
