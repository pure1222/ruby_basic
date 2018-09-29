class GuestsController < ApplicationController
  before_action :nothing_cart,{only:[:form]}
  def form
  end
  def pay_form
    @guest = Guest.new(
      firstname: params[:first],lastname: params[:last],first_furigana: params[:first_furigana],last_furigana: params[:last_furigana],
      first_zip_code: params[:zip_code1],last_zip_code: params[:zip_code2],prefectures: params[:prefectures],municipalities: params[:municipalities],
      address: params[:address],phone_number: params[:phone],email: params[:email],cart_id: session[:cart_id], request_food: params[:request_food]
    )
    @items = Item.where(cart_id: session[:cart_id])
    @cart = Cart.find_by(id: session[:cart_id])
  end
  def confirm
    @items = Item.where(cart_id: session[:cart_id])
    @cart = Cart.find_by(id: session[:cart_id])
    @guest = Guest.find_by(cart_id: session[:cart_id])
  end
  def nothing_cart
    @item = Item.find_by(cart_id: session[:cart_id])
    if @item.blank?
      redirect_to("/carts/#{session[:cart_id]}")
    end
  end
  def order

    @items = Item.where(cart_id: session[:cart_id])
    @cart = Cart.find_by(id: session[:cart_id])
    @posts = Post.where(cart_id: session[:cart_id])
    @guest = Guest.new(
      firstname: params[:first],lastname: params[:last],first_furigana: params[:first_furigana],last_furigana: params[:last_furigana],
      first_zip_code: params[:zip_code1],last_zip_code: params[:zip_code2],prefectures: params[:prefectures],municipalities: params[:municipalities],
      address: params[:address],phone_number: params[:phone],email: params[:email],cart_id: session[:cart_id],request_food: params[:request_food]
    )
    if @guest.save
      OrderMailer.order_confirm(@guest,@items,@cart).deliver
      OrderMailer.manager_post(@items,@guest).deliver
      flash[:notice]="お客様情報を入力しました"
      redirect_to("/guests/confirm")
    else
      flash[:notice]="入力されていない情報があります"
      render("guests/pay_form")
    end

  end
end
