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
      expect(assigns(:rate_value)).not_to be_nil
    end

    it 'checking that the value to equal value of last rate' do
      expect(assigns(:rate_value)).to eq(rate.value)
    end
  end

  describe "GET #new" do
    before { get :new }

    it "assigns a new Rate to @rate" do
      expect(assigns(:rate)).to be_a_new(Rate)
    end

    it "renders new view" do
      expect(response).to render_template :new
    end
  end

  describe 'POST /rates' do
    let(:create_rate) { post :create, params: { rate: attributes_for(:rate) } }
    let(:create_invalid_rate) { post :create, params: { rate: { value: nil } } }

    context 'valid attributes' do
      it 'saves the new rate in the database' do
        expect { create_rate }.to change(Rate, :count).by(1)
      end

      it "redirect to root path" do
        create_rate
        expect(response).to redirect_to root_path
      end
    end

    context 'invalid attributes' do
      it "does not save the article" do
        expect { create_invalid_rate }.to_not change(Rate, :count)
      end

      it "re-renders new view" do
        create_invalid_rate
        expect(response).to render_template :new
      end
    end
  end
end
