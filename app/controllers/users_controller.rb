class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @item = Item.new
    @items = @user.items
  end
end
