require 'rails_helper'

describe RatesController do
  describe 'GET /rates' do
    let!(:rate) { create(:rate) }

    before { get :index }

    it 'renders index view' do
      expect(response).to render_template :index
    end

    it 'return status 200' do
      expect(response.status).to eq 200
    end

    it 'checking that the value exists' do
      expect(assigns(:rate)).not_to be_nil
    end

    it 'checking that the value to equal value of last rate' do
      expect(assigns(:rate)).to eq(rate.value)
    end
  end
end
