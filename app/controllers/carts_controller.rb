class CartsController < ApplicationController
    def show
        @items = Item.where(cart_id: session[:cart_id])
    end
    def add_item
        @item = Item.new(post_id: params[:id],cart_id: session[:cart_id])
        @item.save
        flash[:notice]="カートに入りました"
        redirect_to("/carts/#{session[:cart_id]}")
        
    end
    def destroy
        @item = Item.find_by(post_id: params[:id])
        @post = Post.find_by(id: params[:id])
        @item.destroy
        flash[:notice] = "カートから#{@post.title}を外しました"        
        redirect_to("/carts/#{session[:cart_id]}")
    end
        
end