module Contexts
  module Orders
      
    def create_orders
      @john1 = FactoryGirl.create(:order, user: @john, school: @s2, grand_total: 91.75, date: 6.weeks.ago.to_date)
      @john1.pay
      @steve1 = FactoryGirl.create(:order, user: @steve, school: @s1, grand_total: 70.70, date: 8.months.ago.to_date)
      @steve1.pay
      @paul1 = FactoryGirl.create(:order, user: @paul, school: @s3, grand_total: 21.20, payment_receipt: nil, date: Date.current)
    end
    
    def destroy_orders
      @john1.delete 
      @steve1.delete
      @paul1.delete
    end

  end
end