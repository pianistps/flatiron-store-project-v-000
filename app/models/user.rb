class User < ActiveRecord::Base
  has_many :carts
  has_secure_password
  def current_cart
    #define current cart here ...?
  end

  def current_cart=(c)
  end

end
