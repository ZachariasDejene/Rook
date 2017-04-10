module Contexts
  module OrderItems
    # Context for order_items (assumes item, order contexts plus contexts associated with order)
    def create_order_items
      @john2 = FactoryGirl.create(:order_item, order: @john1, item: @zmf_red_clock, quantity: 1, shipped_on: 6.days.ago.to_date)
      @steve2 = FactoryGirl.create(:order_item, order: @steve1, item: @mahogany_board, quantity: 2, shipped_on: 6.days.ago.to_date)
      @paul2   = FactoryGirl.create(:order_item, order: @paul1, item: @vinyl_blue, quantity: 8)
    end
    
    def destroy_order_items
      @john2.delete
      @steve2.delete
      @paul2.delete
    end

  end
end
