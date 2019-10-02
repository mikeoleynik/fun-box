# frozen_string_literal: true

# class for broadcast real rate value
class ShowRate
  def self.retrieve
    rate_value = GetRate.parsing_rate
    RateBroadcast.new(rate_value).call
  end
end
