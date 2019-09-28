class GetRealRateJob < ApplicationJob
  queue_as :default

  def perform
    GetRate.parsing_rate
  end
end
