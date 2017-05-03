class Cart < ActiveRecord::Base
  # add enum for status 0 = open, 1 = closed?
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  enum status: [:open, :closed]

  def add_item(item_id)
    # creates a new unsaved line_item for new item (FAILED - 4)
    # creates an appropriate line_item (FAILED - 5)
    # updates existing line_item instead of making new when adding same item (FAILED - 6)
    line_item = self.line_items.find_or_initialize_by(item_id: item_id)
  end

  def total
    price = 0.00
    self.items.each do |item|
      price += item.price
    end
    price
  end

end
