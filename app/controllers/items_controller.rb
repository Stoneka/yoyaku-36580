class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def manage
    @items = Item.all
    unless current_customer.admin?
      redirect_to root_path
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
