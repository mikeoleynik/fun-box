# frozen_string_literal: true

class RatePolicy
  # set what to show on #index
  # if there is a forced rate, it shows it value
  # else shows last rate value
  def self.call
    rate_value = Rate.forced_rate.first&.value

    if rate_value.nil?
      rate_value = Rate.where(forced: false).last&.value ||
             Rate.create(value: GetRate.parsing_rate).value
    end
    rate_value
  end
end
