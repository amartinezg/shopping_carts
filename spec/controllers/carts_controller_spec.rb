require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:carts) { create_list(:cart, 5) }
  let(:cart ) { carts.first.id }

  describe 'GET /carts' do
    before { 
      @response = get :index
      @body = JSON.parse(@response.body)
    }

    it "should returns carts" do
      expect(@body).not_to be_empty
      expect(@body["data"].size).to eq(5)
    end

    it "should returns code 200" do
      expect(@response).to have_http_status(200)
    end
  end

  describe 'GET /carts/:id' do
    before { 
      @response = get :show, params: { id: cart }
      @body = JSON.parse(@response.body) 
    }

    it "should returns carts" do
      expect(@body).not_to be_empty
      expect(@body["data"]["id"]).to eq(cart.to_s)
    end

    it "should returns code 200" do
      expect(@response).to have_http_status(200)
    end

    context "When cart does not exist" do
      before {
        @response = get :show, params: { id: 5000 }
        @body = JSON.parse(@response.body) 
      }

      it "should return a not found message" do
        expect(@response.body).to match(/Couldn't find Cart/)
      end

      it "should returns code 404" do
        expect(@response).to have_http_status(404)
      end
    end
  end
end
