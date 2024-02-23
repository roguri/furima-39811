class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :category_id, :condition_id, :shipping_cost_id, :shipping_date_id,
                                 :region_id, :item_information, :image).merge(user_id: current_user.id)
  end
end
