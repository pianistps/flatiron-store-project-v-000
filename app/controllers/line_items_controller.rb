class LineItemsController < ApplicationController

  def create
    current_cart = current_user.current_cart
    item = current_cart.line_items.create(item_id: params[:item_id])
    redirect_to cart_path(current_cart)
  end

end
