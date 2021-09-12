class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
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

  def set_item
    @item = Item.find(params[:id])
  end

  end
