class CartsController < ApplicationController

  def show
  end

  def checkout
    redirect_to cart_path(params[:id])
  end
end
