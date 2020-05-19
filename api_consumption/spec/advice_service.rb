class AdviceService
  def connection
    Faraday.new(url: 'https://api.adviceslip.com')
  end

  def random
    response = connection.get('/advice')
    JSON.parse(response.body, symbolize: true)
  end

  def search(query)
    response = connection.get("/advice/search/#{query}")
    JSON.parse(response.body, symbolize: true)
  end
end