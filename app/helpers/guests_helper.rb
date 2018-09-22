module GuestsHelper
  def destroy_cart_session
      session[:cart_id] = nil
  end
  def create_cart
    @cart = Cart.create(total_price:0)
    session[:cart_id] = @cart.id
  end
      
end
