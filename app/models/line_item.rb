class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :item

  after_initialize :set_quantity

  private

  def set_quantity
    self.quantity ||= 1
  end

end
