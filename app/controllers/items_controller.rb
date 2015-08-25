class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @user = User.find(params[:user_id])
    @items = @user.items
    @item.user = @user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item has been created"
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
