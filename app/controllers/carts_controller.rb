class CartsController < ApplicationController

  def all_delete
    # current_cart.cart_items.delete_all
    # current_cart.delete
    current_cart.dkx_clean!
    redirect_to :back
    flash[:notice] = "以全部清空"
  end

  def destroy
    cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    cart_item.destroy
    redirect_to :back
    flash[:notice] = "#{cart_item.product.title}已被删除"
  end

  def checkout
    @order = Order.new
  end
  
end
