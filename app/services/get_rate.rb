# frozen_string_literal: true

class GetRate
  URL = 'https://www.cbr-xml-daily.ru/daily_json.js'

  def self.parsing_rate
    res = Faraday.get(URL)
    rate_value = JSON.parse(res.body).dig('Valute', 'USD', 'Value')
    RateBroadcast.new(rate_value).call
    rate_value
  end
end
