class OrderItem < ActiveRecord::Base

# Relationships
  belongs_to :item
  belongs_to :order

  # Scopes
  scope :shipped, -> { where.not(shipped_on: nil) }
  scope :unshipped, -> { where(shipped_on: nil) }

  # Validations
  validates_numericality_of :quantity, only_integer: true, greater_than: 0
  validate :item_is_active_in_system

  #Methods
  def subtotal(date=Date.current)
    if date.future?
        return nil
    end
    return (self.item.price_on_date(date) * self.quantity)
  end

  def shipped
    set_ship_date_to_current_date
    reduce_inventory_level
  end

private
  def set_ship_date_to_current_date
    self.shipped_on = Date.current
    self.save!
  end

  def reduce_inventory_level
    productSold = self.item
    productSold.inventory_level -= self.quantity
    productSold.save!
  end

  def item_is_active_in_system
    all_active_items = Item.active.all.map(&:id)
    unless all_active_items.include?(self.item_id)
      errors.add(:item_id, "is not an active item at the chess store")
    end
  end
  
end
