class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :explanation, :size_id, :price,
      :calorie, :protein, :fat, :salt, :carb
    )
  end

  end
