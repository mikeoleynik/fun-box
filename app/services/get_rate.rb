# frozen_string_literal: true

class GetRate
  URL = 'https://www.cbr-xml-daily.ru/daily_json.js'

  # gets the rate of CBR
  def self.parsing_rate
    res = Faraday.get(URL)
    JSON.parse(res.body).dig('Valute', 'USD', 'Value')
  end
end
