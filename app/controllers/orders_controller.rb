class OrdersController < ApplicationController

  def create
    @order = current_user.orders.new
    @order.total = current_cart.total_price

    if @order.save
      redirect_to order_path(@order)
    else
      render :'carts/checkout'
    end

  end
end
