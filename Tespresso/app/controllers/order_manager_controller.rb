class OrderManagerController < ApplicationController
  def addProductToCart
    @user = current_user
    @product = Product.find(params[:id])
    @order = Order.where("user_id == ? AND state LIKE ?", "#{@user.id}", "Carrito")
    if (@order.length <= 0)
      @order = Order.create(user_id: @user.id, state: "Carrito")
      if @order.save
        @order_item = OrderItem.new(order_id: @order.id, product_id: @product.id)
        if @order_item.save
          redirect_to "/"
        end
      end
    else
      @order.each do |t|
        @order_item = OrderItem.new(order_id: t.id, product_id: @product.id)
        if @order_item.save
          redirect_to "/"
        end
      end
    end
  end

  def orderCompleted
    @order = Order.find(params[:id])
    @order.state ="Pagado"
    if @order.save
      redirect_to "/cart"
    end
  end
end
