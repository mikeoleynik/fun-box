# frozen_string_literal: true

# FormObject to create rate and
# broadcast the new rate value after a period of time
class CreateRate
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end

  def call
    return false unless rate.valid?

    rate.save
    # rate will be updated (will be real) when end date ends
    GetRealRateJob.set(wait_until: rate.end_date).perform_later
  end
end
