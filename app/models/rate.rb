# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :value, numericality: true
  validates :value, presence: true

  def self.update_rate
    rate_value = GetRate.parsing_rate
    Rate.last.update(value: rate_value)
    RateBroadcast.new(rate_value).call
  end
end
