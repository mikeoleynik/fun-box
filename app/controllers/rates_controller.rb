# frozen_string_literal: true

class RatesController < ApplicationController
  before_action :set_rates, only: [:new, :create]
  after_action :publish_rate, only: [:create]

  def index
    @rate_value = RatePolicy.call
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(rate_params)

    if CreateRate.new(@rate).call
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:value, :end_date, :forced)
  end

  def set_rates
    @rates = Rate.forced
  end

  def publish_rate
    return if @rate.errors.any?

    RateBroadcast.new(@rate.value).call
  end
end
