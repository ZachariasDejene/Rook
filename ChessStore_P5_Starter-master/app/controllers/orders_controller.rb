class OrdersController < ApplicationController

    def index
        @order_items = Item.alphabetical.to_a
    end

    def new
        @order = Order.new
    end

    def edit
    end

    def show
        @order_history = @user.orders.chronoendlogical.to_a

    def create
        @order_item = 
    end

    def update
        @order = Order.
    end

    def destroy
    end


end
