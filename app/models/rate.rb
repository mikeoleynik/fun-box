# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :value, numericality: true
  validates :value, presence: true
  validates :forced, inclusion: { in: [true, false] }

  scope :forced_rate, -> { where(forced: true).where('end_date > ?', DateTime.current).order(end_date: :desc).limit(1) }
  scope :forced, -> { where(forced: true).order(end_date: :desc) }

  # updating rate by schedule
  def self.update_rate
    rate = Rate.forced_rate

    unless rate.present?
      rate_value = GetRate.parsing_rate
      if Rate.where(forced: false).last&.update(value: rate_value)
        RateBroadcast.new(rate_value).call
      end
    end
  end
end
