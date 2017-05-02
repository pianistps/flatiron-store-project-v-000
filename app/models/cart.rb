class Cart < ActiveRecord::Base
  # add enum for status 0 = open, 1 = closed?
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item
    # creates a new unsaved line_item for new item (FAILED - 4)
    # creates an appropriate line_item (FAILED - 5)
    # updates existing line_item instead of making new when adding same item (FAILED - 6)
  end

  def title
    # can calculate its total
  end

end
