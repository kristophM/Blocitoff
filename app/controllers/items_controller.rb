class ItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @item = current_user.items.new(item_params)
    @user = User.find(params[:user_id])
    @items = current_user.items
    @item.user = current_user
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

  def destroy
    @item = Item.find(params[:id])
    @user = @item.user
    if @item.destroy
      flash[:notice] = "Item has been removed"
    else
      flash[:error] = "There was an error in removing the item"
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
