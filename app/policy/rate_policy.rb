# frozen_string_literal: true

class RatePolicy
  def self.call
    rate = Rate.forced_rate.first&.value

    if rate.nil?
      rate = Rate.where(forced: false).last&.value ||
             Rate.create(value: GetRate.parsing_rate).value
    end
    rate
  end
end
