require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'update rate' do
    let!(:rate) { create(:rate) }

    subject(:value) { GetRate.parsing_rate }

    before { Rate.update_rate }

    it 'rate value is updated' do
      rate.reload
      expect(rate.value).to eq(value.to_s)
    end
  end
end
