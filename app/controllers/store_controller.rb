class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.available_items
    @current_user = current_user
  end
end
