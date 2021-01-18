class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :area, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
