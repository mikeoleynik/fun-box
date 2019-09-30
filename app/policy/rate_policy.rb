# frozen_string_literal: true

class RatePolicy
  # set what to show on #index
  # if there is a forced rate, it shows it
  # else shows last rate
  def self.call
    rate = Rate.forced_rate.first&.value

    if rate.nil?
      rate = Rate.where(forced: false).last&.value ||
             Rate.create(value: GetRate.parsing_rate).value
    end
    rate
  end
end
