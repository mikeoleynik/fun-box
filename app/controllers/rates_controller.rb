# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    @rate = Rate.last&.value || Rate.create(value: GetRate.parsing_rate).value
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(rate_params)

    if @rate.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:value, :end_date, :forced)
  end
end
