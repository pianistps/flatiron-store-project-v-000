class User < ActiveRecord::Base
  has_many :carts

  def current_cart
    #define current cart here ...?
  end

end
