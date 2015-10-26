require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do

  describe "Get #index" do
    before(:each) do 
      current_user = FactoryGirl.create :user 
      request.headers['Authorization'] = current_user.auth_token
      4.times { FactoryGirl.create :order, user: current_user }
      get :index, user_id: current_user.id, format: :json

    end

    it "returns 4 order records from the user" do 
      orders_response = json_response[:orders]
      expect(orders_response.length).to eq(4)
    end

    it { should respond_with 200}

  end
end
