class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update_items]
  
  def index
    @carts = Cart.all
    @json = CartSerializer.new(@carts).serialized_json

    render json: @json, status: status
  end

  def show
    render json: CartSerializer.new(@cart).serialized_json, status: status
  end

  def update_items
    params = update_items_params
    @cart.items << create_or_update_items
    @cart.save
    render json: CartSerializer.new(@cart.reload).serialized_json, status: status
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def update_items_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.permit(:id, item_details: [:price, :name])
  end

  def create_or_update_items
    params[:item_details].map do |details|
      item = Item.find_or_create_by(name: details[:name])
      item.update_attributes(price: details["price"])
      item
    end
  end
end
