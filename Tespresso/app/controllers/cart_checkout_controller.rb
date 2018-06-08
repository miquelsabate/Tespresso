class CartCheckoutController < ApplicationController
  before_action :set_paypaltoken, :only => [:createpayment, :executepayment]

def set_paypaltoken
  @paypaltoken = 'A21AAFAsFFCnYfbyT-OGesJetHiUkx57kj0cWyAMhR_eo4G2_SL45PPLuoHxGSO7e71ZvWoByVPNGOR7d4M76msZgMqToaFPg'
end

def index
end

def createpayment
@response = HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment',
    :headers => { 'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@paypaltoken}"},
    :body =>  {   :intent => 'sale',
    :redirect_urls => {'return_url' => 'localhost:3000','cancel_url' => 'localhost:3000'},
    :payer => {'payment_method' => 'paypal'},
    :transactions => [{'amount' => {'total' => '3.00','currency' => 'EUR'}}]
        }.to_json, :debug_output => Rails.logger)
    render json: {
        paymentID: "#{@response["id"]}"
        }.to_json
end

def executepayment
  @response = HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment/#{params[:paymentID]}/execute/",
    :headers => { 'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@paypaltoken}"},
    :body =>  { :payer_id => "#{params[:payerID]}"}.to_json, :debug_output => Rails.logger)
end

end
