class CartCheckoutController < ApplicationController
  before_action :set_paypaltoken, :only => [:createpayment, :executepayment]

    def home
      @order = Order.find(params[:id])
   		@order_items = OrderItem.where("order_id == ?", "#{@order.id}")
      @products = Product.all
      @total = 0
      @order_items.each do |t|
        price = @products[t.product_id-1].price
        @total += price
      end
      @total = (@total* 1000).floor / 1000.0
      if @total == 0
        redirect_back(fallback_location: root_path, flash: {notice: '<div class="alert alert-danger" role="alert">No hay productos en el pedido. No se ha podido proceder al pago</div>'})
      end
    end

    def set_paypaltoken
      @paypaltoken = 'A21AAFHrXKHpZSipwoOZ2_HurxpMlYqiJPdJew-L1h5mZN-yBRpu4PPgFlhOVaSMeKiOImtLruUxTl5Zbxs_Vv6B-wemMlsRQ'
    end

    def createpayment
   		@order = Order.find(params[:id])
   		@order_items = OrderItem.where("order_id == ?", "#{@order.id}")
      @products = Product.all
      @total = 0
      @order_items.each do |t|
        price = @products[t.product_id-1].price
        @total += price
      end
      @total = (@total* 1000).floor / 1000.0
      @response =
      HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment',
      :headers => { 'Content-Type' => 'application/json',
                    'Authorization' => "Bearer #{@paypaltoken}"},
      :body =>  {   :intent => 'sale',
                    :redirect_urls => {'return_url' =>
      "/completed/#{@order.id}",'cancel_url' => '/'},
                    :payer => {'payment_method' => 'paypal'},
                    :transactions => [{'amount' => {'total' => "#{@total}",
      'currency' => 'EUR'}}]
                    }.to_json, :debug_output => Rails.logger)
            render json: {
                    paymentID: "#{@response["id"]}"
                  }.to_json
    end

    def executepayment
      @response =
      HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment/#{params[:paymentID]}/execute/",
            :headers => { 'Content-Type' => 'application/json',
                    'Authorization' => "Bearer #{@paypaltoken}"},
            :body =>  { :payer_id => "#{params[:payerID]}"}.to_json, :debug_output => Rails.logger)
  end

end
