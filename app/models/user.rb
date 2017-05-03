class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts

  
  def current_cart
    if self.carts.include?(status: 'open')
      self.carts.where(status: 'open')
    else
      self.carts.create(status: 'open')
    end
  end

  def current_cart=(c)
    # do we need to set a cart using this method? Doesn't look like.
  end

end
