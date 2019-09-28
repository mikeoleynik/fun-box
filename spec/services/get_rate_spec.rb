require 'rails_helper'

RSpec.describe GetRate do
  subject(:value) { GetRate.parsing_rate }

  it 'returns value from the central bank' do
    expect(value).not_to be_nil
  end

  it 'value is digit' do
    expect(value).to be_instance_of(Float)
  end
end
