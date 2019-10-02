# frozen_string_literal: true

class GetRealRateJob < ApplicationJob
  queue_as :default

  def perform
    ShowRate.retrieve
  end
end
