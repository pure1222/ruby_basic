class GuestsController < ApplicationController
  def form
  end
  def pay_form
    @guest = Guest.new(
      firstname: params[:first],lastname: params[:last],first_furigana: params[:first_furigana],last_furigana: params[:last_furigana],
      first_zip_code: params[:zip_code1],last_zip_code: params[:zip_code2],prefectures: params[:prefectures],municipalities: params[:municipalities],
      address: params[:address],phone_number: params[:phone],email: params[:email]
    )
    @guest.save
  end
  def pay
    @cart = Cart.find_by(id: session[:cart_id])
    Payjp.api_key = 'sk_test_2af2e4ebf9a54605060ff31b'
    charge = Payjp::Charge.create(
      :amount => @cart.total_price,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
    flash[:notice] = "ありがとうございました"
    redirect_to("/posts/index")
  end
end
