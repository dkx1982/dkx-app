class CartsController < ApplicationController

  def all_delete
    current_cart.cart_items.delete_all
    redirect_to :back
    flash[:notice] = "以全部清空"
  end

  def destroy
    cart_item = current_cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to :back
    flash[:notice] = "#{cart_item.product.title}已被删除"
  end
end
