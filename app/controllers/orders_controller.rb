class OrdersController < ApplicationController

  def create
    @order = current_user.orders.new
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = @order.product_lists.new
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.image = cart_item.product.image
        product_list.save
      end
      redirect_to order_path(@order)
    else
      render :'carts/checkout'
    end

  end
  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end
end
