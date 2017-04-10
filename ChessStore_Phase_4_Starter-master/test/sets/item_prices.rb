module Contexts
  module ItemPrices
    # Context for item_prices (assumes items context)
    def create_item_prices
      create_manufacturer_item_prices      
      create_wholesale_item_prices
    end

    def destroy_item_prices
      destroy_manufacturer_item_prices     
      destroy_wholesale_item_prices
    end

    def create_manufacturer_item_prices
      create_board_prices_manufacturer
      create_piece_prices_manufacturer
      create_clock_prices_manufacturer
      create_supply_prices_manufacturer
    end

    def destroy_manufacturer_item_prices
      destroy_board_prices_manufacturer
      destroy_piece_prices_manufacturer
      destroy_clock_prices_manufacturer
      destroy_supply_prices_manufacturer
    end 

    def create_wholesale_item_prices
      create_board_prices_wholesale
      create_piece_prices_wholesale
      create_clock_prices_wholesale
      create_supply_prices_wholesale
    end
  
    def destroy_wholesale_item_prices
      destroy_board_prices_wholesale
      destroy_piece_prices_wholesale
      destroy_clock_prices_wholesale
      destroy_supply_prices_wholesale
    end

    def create_board_prices_manufacturer
      @vbg1_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 1.85, start_date: 24.months.ago.to_date)
      @vbg2_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 2.15, start_date: 14.months.ago.to_date)
      @vbg3_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 2.50, start_date: 6.months.ago.to_date)
      @vbg4_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_green, category: "manufacturer", price: 2.75, start_date: 4.weeks.ago.to_date)

      @vbb1_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 2.05, start_date: 24.months.ago.to_date)
      @vbb2_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 2.35, start_date: 14.months.ago.to_date)
      @vbb3_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 2.95, start_date: 6.months.ago.to_date)
      @vbb4_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_blue, category: "manufacturer", price: 3.10, start_date: 4.weeks.ago.to_date)

      @vbr1_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 2.05, start_date: 24.months.ago.to_date)
      @vbr2_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 2.35, start_date: 14.months.ago.to_date)
      @vbr3_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 2.95, start_date: 6.months.ago.to_date)
      @vbr4_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_red, category: "manufacturer", price: 3.10, start_date: 4.weeks.ago.to_date)

      @vbk1_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 1.85, start_date: 24.months.ago.to_date)
      @vbk2_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 2.15, start_date: 14.months.ago.to_date)
      @vbk3_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 2.50, start_date: 6.months.ago.to_date)
      @vbk4_manufacturer = FactoryGirl.create(:item_price, item: @vinyl_black, category: "manufacturer", price: 2.75, start_date: 4.weeks.ago.to_date)

      @mgh1_manufacturer = FactoryGirl.create(:item_price, item: @mahogany_board, category: "manufacturer", price: 23.00, start_date: 24.months.ago.to_date)
      @mgh2_manufacturer = FactoryGirl.create(:item_price, item: @mahogany_board, category: "manufacturer", price: 25.95, start_date: 13.months.ago.to_date)
      @mgh3_manufacturer = FactoryGirl.create(:item_price, item: @mahogany_board, category: "manufacturer", price: 29.00, start_date: 180.days.ago.to_date)

      @map1_manufacturer = FactoryGirl.create(:item_price, item: @maple_board, category: "manufacturer", price: 39.95, start_date: 12.months.ago.to_date)
      @map2_manufacturer = FactoryGirl.create(:item_price, item: @maple_board, category: "manufacturer", price: 42.00, start_date: 6.months.ago.to_date)
      @map3_manufacturer = FactoryGirl.create(:item_price, item: @maple_board, category: "manufacturer", price: 44.95, start_date: 2.weeks.ago.to_date)
    end

    def create_board_prices_wholesale
      @vbg1 = FactoryGirl.create(:item_price, item: @vinyl_green, price: 1.85, start_date: 24.months.ago.to_date)
      @vbg2 = FactoryGirl.create(:item_price, item: @vinyl_green, price: 2.15, start_date: 14.months.ago.to_date)
      @vbg3 = FactoryGirl.create(:item_price, item: @vinyl_green, price: 2.50, start_date: 6.months.ago.to_date)
      @vbg4 = FactoryGirl.create(:item_price, item: @vinyl_green, price: 2.75, start_date: 4.weeks.ago.to_date)
           
      @vbb1 = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 2.05, start_date: 24.months.ago.to_date)
      @vbb2 = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 2.35, start_date: 14.months.ago.to_date)
      @vbb3 = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 2.95, start_date: 6.months.ago.to_date)
      @vbb4 = FactoryGirl.create(:item_price, item: @vinyl_blue, price: 3.10, start_date: 4.weeks.ago.to_date)
           
      @vbr1 = FactoryGirl.create(:item_price, item: @vinyl_red, price: 2.05, start_date: 24.months.ago.to_date)
      @vbr2 = FactoryGirl.create(:item_price, item: @vinyl_red, price: 2.35, start_date: 14.months.ago.to_date)
      @vbr3 = FactoryGirl.create(:item_price, item: @vinyl_red, price: 2.95, start_date: 6.months.ago.to_date)
      @vbr4 = FactoryGirl.create(:item_price, item: @vinyl_red, price: 3.10, start_date: 4.weeks.ago.to_date)
           
      @vbk1 = FactoryGirl.create(:item_price, item: @vinyl_black, price: 1.85, start_date: 24.months.ago.to_date)
      @vbk2 = FactoryGirl.create(:item_price, item: @vinyl_black, price: 2.15, start_date: 14.months.ago.to_date)
      @vbk3 = FactoryGirl.create(:item_price, item: @vinyl_black, price: 2.50, start_date: 6.months.ago.to_date)
      @vbk4 = FactoryGirl.create(:item_price, item: @vinyl_black, price: 2.75, start_date: 4.weeks.ago.to_date)
           
      @mgh1 = FactoryGirl.create(:item_price, item: @mahogany_board, price: 23.00, start_date: 24.months.ago.to_date)
      @mgh2 = FactoryGirl.create(:item_price, item: @mahogany_board, price: 25.95, start_date: 13.months.ago.to_date)
      @mgh3 = FactoryGirl.create(:item_price, item: @mahogany_board, price: 29.00, start_date: 180.days.ago.to_date)
           
      @map1 = FactoryGirl.create(:item_price, item: @maple_board, price: 39.95, start_date: 12.months.ago.to_date)
      @map2 = FactoryGirl.create(:item_price, item: @maple_board, price: 42.00, start_date: 6.months.ago.to_date)
      @map3 = FactoryGirl.create(:item_price, item: @maple_board, price: 44.95, start_date: 2.weeks.ago.to_date)
    end

    def create_piece_prices_manufacturer
      @bcp1_manufacturer = FactoryGirl.create(:item_price, item: @basic_pieces, category: "manufacturer", price: 1.95, start_date: 24.months.ago.to_date)
      @bcp2_manufacturer = FactoryGirl.create(:item_price, item: @basic_pieces, category: "manufacturer", price: 2.25, start_date: 12.months.ago.to_date)
      @bcp3_manufacturer = FactoryGirl.create(:item_price, item: @basic_pieces, category: "manufacturer", price: 2.50, start_date: 6.months.ago.to_date)

      @wtp1_manufacturer = FactoryGirl.create(:item_price, item: @weighted_pieces, category: "manufacturer", price: 2.95, start_date: 24.months.ago.to_date)
      @wtp2_manufacturer = FactoryGirl.create(:item_price, item: @weighted_pieces, category: "manufacturer", price: 3.50, start_date: 12.months.ago.to_date)
      @wtp3_manufacturer = FactoryGirl.create(:item_price, item: @weighted_pieces, category: "manufacturer", price: 4.50, start_date: 6.months.ago.to_date)

      @wdp1_manufacturer = FactoryGirl.create(:item_price, item: @wooden_pieces, category: "manufacturer", price: 5.95, start_date: 24.months.ago.to_date)
      @wdp2_manufacturer = FactoryGirl.create(:item_price, item: @wooden_pieces, category: "manufacturer", price: 6.25, start_date: 12.months.ago.to_date)
      @wdp3_manufacturer = FactoryGirl.create(:item_price, item: @wooden_pieces, category: "manufacturer", price: 7.50, start_date: 6.months.ago.to_date)
    end

    def create_piece_prices_wholesale
      @bcp1 = FactoryGirl.create(:item_price, item: @basic_pieces, price: 1.95, start_date: 24.months.ago.to_date)
      @bcp2 = FactoryGirl.create(:item_price, item: @basic_pieces, price: 2.25, start_date: 12.months.ago.to_date)
      @bcp3 = FactoryGirl.create(:item_price, item: @basic_pieces, price: 2.50, start_date: 6.months.ago.to_date)
           
      @wtp1 = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 2.95, start_date: 24.months.ago.to_date)
      @wtp2 = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 3.50, start_date: 12.months.ago.to_date)
      @wtp3 = FactoryGirl.create(:item_price, item: @weighted_pieces, price: 4.50, start_date: 6.months.ago.to_date)
           
      @wdp1 = FactoryGirl.create(:item_price, item: @wooden_pieces, price: 5.95, start_date: 24.months.ago.to_date)
      @wdp2 = FactoryGirl.create(:item_price, item: @wooden_pieces, price: 6.25, start_date: 12.months.ago.to_date)
      @wdp3 = FactoryGirl.create(:item_price, item: @wooden_pieces, price: 7.50, start_date: 6.months.ago.to_date)
    end

    def create_clock_prices_manufacturer
      @ana1_manufacturer = FactoryGirl.create(:item_price, item: @analog_clock, category: "manufacturer", price: 10.95, start_date: 24.months.ago.to_date)
      @zcr1_manufacturer = FactoryGirl.create(:item_price, item: @zmf_red_clock, category: "manufacturer", price: 21.95, start_date: 24.months.ago.to_date)
      @zcg1_manufacturer = FactoryGirl.create(:item_price, item: @zmf_green_clock, category: "manufacturer", price: 19.95, start_date: 24.months.ago.to_date)
      @chc1_manufacturer = FactoryGirl.create(:item_price, item: @chronos_clock, category: "manufacturer", price: 60.00, start_date: 24.months.ago.to_date)
    end

    def create_clock_prices_wholesale
      @ana1 = FactoryGirl.create(:item_price, item: @analog_clock, price: 10.95, start_date: 24.months.ago.to_date)
      @zcr1 = FactoryGirl.create(:item_price, item: @zmf_red_clock, price: 21.95, start_date: 24.months.ago.to_date)
      @zcg1 = FactoryGirl.create(:item_price, item: @zmf_green_clock, price: 19.95, start_date: 24.months.ago.to_date)
      @chc1 = FactoryGirl.create(:item_price, item: @chronos_clock, price: 60.00, start_date: 24.months.ago.to_date)
    end

    def create_supply_prices_manufacturer
      @cbg1_manufacturer = FactoryGirl.create(:item_price, item: @chess_bag_green, category: "manufacturer", price: 6.95, start_date: 24.months.ago.to_date)
      @cbb1_manufacturer = FactoryGirl.create(:item_price, item: @chess_bag_brown, category: "manufacturer", price: 6.95, start_date: 24.months.ago.to_date)
      @dem1_manufacturer = FactoryGirl.create(:item_price, item: @demo_board, category: "manufacturer", price: 19.95, start_date: 24.months.ago.to_date)
      @sbk1_manufacturer = FactoryGirl.create(:item_price, item: @scorebook, category: "manufacturer", price: 1.50, start_date: 24.months.ago.to_date)
    end

    def create_supply_prices_wholesale
      @cbg1 = FactoryGirl.create(:item_price, item: @chess_bag_green, price: 6.95, start_date: 24.months.ago.to_date)
      @cbb1 = FactoryGirl.create(:item_price, item: @chess_bag_brown, price: 6.95, start_date: 24.months.ago.to_date)
      @dem1 = FactoryGirl.create(:item_price, item: @demo_board, price: 19.95, start_date: 24.months.ago.to_date)
      @sbk1 = FactoryGirl.create(:item_price, item: @scorebook, price: 1.50, start_date: 24.months.ago.to_date)
    end

    def destroy_board_prices_manufacturer
      @vbg1_manufacturer.delete
      @vbg2_manufacturer.delete
      @vbg3_manufacturer.delete
      @vbg4_manufacturer.delete
      @vbb1_manufacturer.delete
      @vbb2_manufacturer.delete
      @vbb3_manufacturer.delete
      @vbb4_manufacturer.delete
      @vbr1_manufacturer.delete
      @vbr2_manufacturer.delete
      @vbr3_manufacturer.delete
      @vbr4_manufacturer.delete
      @vbk1_manufacturer.delete
      @vbk2_manufacturer.delete
      @vbk3_manufacturer.delete
      @vbk4_manufacturer.delete
      @mgh1_manufacturer.delete
      @mgh2_manufacturer.delete
      @mgh3_manufacturer.delete
      @map1_manufacturer.delete
      @map2_manufacturer.delete
      @map3_manufacturer.delete
    end

    def destroy_board_prices_wholesale
      @vbg1.delete
      @vbg2.delete
      @vbg3.delete
      @vbg4.delete
      @vbb1.delete
      @vbb2.delete
      @vbb3.delete
      @vbb4.delete
      @vbr1.delete
      @vbr2.delete
      @vbr3.delete
      @vbr4.delete
      @vbk1.delete
      @vbk2.delete
      @vbk3.delete
      @vbk4.delete
      @mgh1.delete
      @mgh2.delete
      @mgh3.delete
      @map1.delete
      @map2.delete
      @map3.delete
    end

    def destroy_piece_prices_manufacturer
      @bcp1_manufacturer.delete
      @bcp2_manufacturer.delete
      @bcp3_manufacturer.delete
      @wtp1_manufacturer.delete
      @wtp2_manufacturer.delete
      @wtp3_manufacturer.delete
      @wdp1_manufacturer.delete
      @wdp2_manufacturer.delete
      @wdp3_manufacturer.delete
    end

    def destroy_piece_prices_wholesale
      @bcp1.delete
      @bcp2.delete
      @bcp3.delete
      @wtp1.delete
      @wtp2.delete
      @wtp3.delete
      @wdp1.delete
      @wdp2.delete
      @wdp3.delete
    end

    def destroy_clock_prices_manufacturer
      @ana1_manufacturer.delete
      @zcr1_manufacturer.delete
      @zcg1_manufacturer.delete
      @chc1_manufacturer.delete
    end

    def destroy_clock_prices_wholesale
      @ana1.delete
      @zcr1.delete
      @zcg1.delete
      @chc1.delete
    end

    def destroy_supply_prices_manufacturer
      @cbg1_manufacturer.delete
      @cbb1_manufacturer.delete
      @dem1_manufacturer.delete
      @sbk1_manufacturer.delete
    end

    def destroy_supply_prices_wholesale
      @cbg1.delete
      @cbb1.delete
      @dem1.delete
      @sbk1.delete
    end
  end
end