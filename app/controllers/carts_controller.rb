class CartsController < ApplicationController
      def show
        @order_items=current_order.order_items
      end
      def checkout
        if user_signed_in?
          @order_items=current_order.order_items
         for i in @order_items
          Enrollment.create(watched_videos: i.course.total_videos, user_id: current_user.id,course_id: i.course.id)
         end
        end
        @order_items.clear
        render 'carts/final'
      end
      def destroy
        @cart = @current_cart
        @cart.destroy
        session[:cart_id] = nil
        redirect_to root_path
      end 
end
