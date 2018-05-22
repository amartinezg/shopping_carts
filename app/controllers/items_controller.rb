class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = ItemSerializer.new(Item.all).serialized_json

    render json: @items, status: status
  end

  def show
    render json: ItemSerializer.new(@item).serialized_json, status: status
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
