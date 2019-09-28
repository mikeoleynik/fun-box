# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    @rate = GetRate.parsing_rate
  end

  def new; end
end
