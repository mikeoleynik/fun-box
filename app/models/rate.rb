# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :value, numericality: true
  validates :value, presence: true

  scope :forced_rate, -> { where(forced: true).where('end_date > ?', DateTime.current).order(end_date: :desc).limit(1) }

  def self.update_rate
    rate = Rate.forced_rate.first

    unless rate.present?
      rate_value = GetRate.parsing_rate
      Rate.where(forced: false).last&.update(value: rate_value)
    end
  end
end
