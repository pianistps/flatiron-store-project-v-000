class Cart < ActiveRecord::Base
  # add enum for status 0 = open, 1 = closed?
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  validates :status, inclusion: { in: %w(open submitted) }
  after_initialize :set_status

  enum status: [:open, :submitted]

  def add_item(item_id)
    # creates a new unsaved line_item for new item (FAILED - 4)
    # creates an appropriate line_item (FAILED - 5)
    # updates existing line_item instead of making new when adding same item (FAILED - 6)
    self.line_items.find_or_initialize_by(item_id: item_id).tap do |line_item|
      line_item.quantity += 1 if line_item.persisted?
      line_item.save
    end
  end

  def total
    price = 0.00
    self.line_items.each do |line_item|
      price += line_item.quantity * line_item.item.price
    end
    price
  end

  def checkout
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    self.status = "submitted"
    self.save
  end

  private

  def set_status
    self.status ||= 0
  end

end
