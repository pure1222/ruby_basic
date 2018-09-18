class CartsController < ApplicationController
    def show
        @items = Item.where(cart_id: session[:cart_id])
        @cart = Cart.find_by(id: session[:cart_id])
    end
    def add_item
        @item = Item.new(post_id: params[:id],cart_id: session[:cart_id])
        @item.save
        @cart = Cart.find_by(id: session[:cart_id])
        total_price = @cart.total_price.to_i
        total_price += params[:price].to_i
        @cart.total_price = total_price
        @cart.save
        flash[:notice]="カートに入りました"
        redirect_to("/posts/index")
        flash[:notice] = "カートへ追加しました"
        
    end
    def destroy
        @item = Item.find_by(post_id: params[:id])
        @post = Post.find_by(id: params[:id])
        @item.destroy
        @cart = Cart.find_by(id: session[:cart_id])
        total_price = @cart.total_price.to_i
        total_price -= params[:price].to_i
        @cart.total_price = total_price
        @cart.save
        
        flash[:notice] = "カートから#{@post.title}を外しました"        
        redirect_to("/carts/#{session[:cart_id]}")
    end
        
end