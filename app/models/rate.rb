# frozen_string_literal: true

class Rate < ApplicationRecord
  def self.update_rate
    rate_value = GetRate.parsing_rate
    Rate.last.update(value: rate_value)
  end
end
