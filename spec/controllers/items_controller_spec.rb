require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let!(:items) { create_list(:item, 10) }
  let(:item_id ) { items.first.id }

  describe 'GET /items' do
    before { 
      @response = get :index
      @body = JSON.parse(@response.body)
    }

    it "should returns items" do
      expect(@body).not_to be_empty
      expect(@body["data"].size).to eq(10)
    end

    it "should returns code 200" do
      expect(@response).to have_http_status(200)
    end
  end

  describe 'GET /items/:id' do
    before { 
      @response = get :show, params: { id: item_id }
      @body = JSON.parse(@response.body) 
    }

    it "should returns items" do
      expect(@body).not_to be_empty
      expect(@body["data"]["id"]).to eq(item_id.to_s)
    end

    it "should returns code 200" do
      expect(@response).to have_http_status(200)
    end

    context "When item does not exist" do
      before {
        @response = get :show, params: { id: 5000 }
        @body = JSON.parse(@response.body) 
      }

      it "should return a not found message" do
        expect(@response.body).to match(/Couldn't find Item/)
      end

      it "should returns code 404" do
        expect(@response).to have_http_status(404)
      end
    end
  end
end
