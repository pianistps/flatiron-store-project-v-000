class Item < ActiveRecord::Base

  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    self.all.select { |i| i if i.inventory > 0 }
  end
end
