class GuestsController < ApplicationController
  before_action :nothing_cart,{only:[:form]}
  def form
  end
  def pay_form
    @guest = Guest.new(
      firstname: params[:first],lastname: params[:last],first_furigana: params[:first_furigana],last_furigana: params[:last_furigana],
      first_zip_code: params[:zip_code1],last_zip_code: params[:zip_code2],prefectures: params[:prefectures],municipalities: params[:municipalities],
      address: params[:address],phone_number: params[:phone],email: params[:email],cart_id: session[:cart_id]
    )
    if @guest.save
      
      flash[:notice] = "お客様情報を入力できました"
      redirect_to("/guests/pay_confirm")
    else
      flash[:notice] = "全て入力してください"
      render("guests/form")
    end
  end
  def pay_confirm
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
    @guest = Guest.find_by(id: params[:id])
    @items = Item.where(cart_id: session[:cart_id])
    OrderMailer.order_confirm(@guest).deliver
    OrderMailer.manager_post(@items).deliver
  end
end
