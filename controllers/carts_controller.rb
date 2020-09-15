class CartsController <ApplicationController
   before_action :authenticate_user!,only:[:new]
   def new
      current_user.carts.create(item_id: params[:item_id])#To create new carts with item for current user
      redirect_to items_path
   end
   def destroy
      @cart=current_user.carts.find(params[:id])#When current_user delete cart take tow params (item_id ,cart_id)
      @cart.destroy
      redirect_to items_path
   end
   
end