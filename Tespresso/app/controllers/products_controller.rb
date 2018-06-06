class ProductsController < ApplicationController
	def index
 		@search = params[:search]
 		if @search
 			@products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
 		else
 			@products = Product.all
 		end
 	end

 	def show
 		@product = Product.find(params[:id])
 	end

end
