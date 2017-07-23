class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.cart_items.each do |cart_item|
      if cart_item.product.title == @product.title
        flash[:notice] = "#{@product.title}已经存在购物车中"
        return redirect_to :back

      end
    end
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功加入购物车"
    redirect_to :back
    # flash[:notice] = "测试加入购物车"
  end
end
