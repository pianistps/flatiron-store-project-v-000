class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    # raise @cart.status.inspect
    redirect_to cart_path(@cart)
  end
end
