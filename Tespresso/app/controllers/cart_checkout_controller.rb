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
    end

    def set_paypaltoken
      @paypaltoken = 'A21AAGYw06WgAUlsvBS320LZty9YGX-LtBEt2nsnsWz91_SCBFU8sGB__CCw39Q1QmgsGa7xwdR-NxuIi0cOR5K7IHzao_5cA'
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
      "http://localhost:3000/completed/#{@order.id}",'cancel_url' => 'http://localhost:3000'},
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
