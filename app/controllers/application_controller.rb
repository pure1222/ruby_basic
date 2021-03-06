class ApplicationController < ActionController::Base
   before_action :set_current_user
   before_action :create_cart
   
    def create_cart
      if session[:cart_id]
        @cart = Cart.find_by(id: session[:cart_id])
      else
        @cart = Cart.create(total_price:0)
        session[:cart_id] = @cart.id
      end
    end
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
    def authenticate_user
      if session[:user_id] == nil
        flash[:notice] = "ログインしてください"
        redirect_to("/login")
      end
    end
    def forbit_login_user
        if session[:user_id]
            flash[:notice]="すでにログインしています"
            redirect_to("/posts/index")
        end
    end
    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/users/#{@current_user.id}")
      end
    end
    def admin_user
        if @current_user.admin? == false
            flash[:notice] ="権限がありません"
            redirect_to("/posts/index")
        end
    end
end
