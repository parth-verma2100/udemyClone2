class CartsController < ApplicationController
      def show
        @cart = Course.find(session[:cart]) 
      end
      def remove_from_cart
        redirect_to url_for(:controller => courses, :action => remove_from_cart)
      end
      def destroy
        @cart = @current_cart
        @cart.destroy
        session[:cart_id] = nil
        redirect_to root_path
      end 
end
