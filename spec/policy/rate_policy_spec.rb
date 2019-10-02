require 'rails_helper'

RSpec.describe RatePolicy do
  subject(:rate_policy) { RatePolicy.call }

  context 'end date exists' do
    let!(:rate) { create(:rate, end_date: DateTime.current + 1.hours) }

    it 'returns value from the Central Bank' do
      expect(rate_policy).to eq(rate.value)
    end
  end

  context 'end date not exists' do
    let!(:rate) { create(:rate) }

    it 'returns value of force rate' do
      expect(rate_policy).to eq(rate.value)
    end
  end
end
