class ItemsController < ApplicationController
  before_action :set_user_items,  only: [:new, :create, :edit, :update, :destroy]
     before_action :authenticate_user! ,only: [ :edit, :update, :destroy, :create, :new ,:set_user_items]


     def index
      @items=Item.all
      @carts = current_user.carts #TO RENDER ALL THE ITEMS IN CART FOR CURRENT_USER 
    end
    def show
    @item=Item.find(params[:id])
    end
    def new 
    @item=@items.new
    end 
    def create 
        @item= @items.create(item_params)
        redirect_to root_path(@item)
     end 
     def destroy 
       @item=Item.find(params[:id])
       @item.destroy
       redirect_to root_path
     end
    
    def edit
    @item =Item.find(params[:id])
    end
    def update
     @item =Item.find(params[:id])
     @item.update(item_params)
     redirect_to item_path(@item)
    end
    private
    
    def set_user_items
      @items = current_user.items
    end
     def item_params
      params.require(:item ).permit(:name, :image,:price)
    end
   

end
