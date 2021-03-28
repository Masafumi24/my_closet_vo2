require "rails_helper"

RSpec.describe Api::ItemsController, type: :controller do
  let(:response_hash) { JSON.parse(response.body)}

  describe "POST #create" do
    subject { post :create, params: create_params }

    let(:create_params) do
      {
        item: {
          image: "image",
          purchase_date: "1994/4/1",
          prefecture_id: 1,
          parts_id: 1
        }
      }
    end

    it "createされる" do
      subject
      expect(response_hash["image"]).to eq create_params[:item][:image]
      expect(response_hash["purchase_date"].to_datetime).to eq create_params[:item][:purchase_date].to_datetime
    end
  end

end