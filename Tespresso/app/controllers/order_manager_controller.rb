class OrderManagerController < ApplicationController
  def addProductToCart
    @user = current_user
    if @user != nil
      @product = Product.find(params[:id])
      @order = Order.where("user_id == ? AND state LIKE ?", "#{@user.id}", "Carrito")
      if (@order.length <= 0)
        @order = Order.create(user_id: @user.id, state: "Carrito")
        if @order.save
          @order_item = OrderItem.new(order_id: @order.id, product_id: @product.id)
          if @order_item.save
            redirect_back(fallback_location: root_path, flash: {notice: '<div class="alert alert-success" role="alert">El producto "' "#{@product.name}" '" ha sido añadido a la cesta</div>'})
          end
        end
      else
        @order.each do |t|
          @order_item = OrderItem.new(order_id: t.id, product_id: @product.id)
          if @order_item.save
            redirect_back(fallback_location: root_path, flash: {notice: '<div class="alert alert-success" role="alert">El producto "' "#{@product.name}" '" ha sido añadido a la cesta</div>'})
          end
        end
      end
    else
      redirect_back(fallback_location: root_path, flash: {notice: '<div class="alert alert-danger" role="alert">Es necesario <a href="/users/sign_in">acceder a su cuenta</a> para añadir productos a la cesta.</div>'})
    end
  end

  def orderCompleted
    @order = Order.find(params[:id])
    @order.state ="Pagado"
    if @order.save
      redirect_to "/user"
    end
  end

  def deleteOrderItem
    @order_item = OrderItem.find(params[:id])
    @product = Product.find(@order_item.product_id)
    @item = OrderItem.delete(@order_item.id)
    redirect_back(fallback_location: root_path, flash: {notice: '<div class="alert alert-danger" role="alert">El producto "' "#{@product.name}" '" ha sido eliminado de la cesta</div>'})
  end
end
