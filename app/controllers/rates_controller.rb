# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    @rate = Rate.last&.value || Rate.create(value: GetRate.parsing_rate).value
  end

  def new; end
end
