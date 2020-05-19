class ChuckService
  def connection
    Faraday.new(url: 'https://api.chucknorris.io')
  end

  def random
    response = connection.get('/jokes/random')
    JSON.parse(response.body, symbolize: true)
  end

  def random_in_category(category)
    response = connection.get("jokes/random?category=#{category}")
    JSON.parse(response.body, symbolize: true)
  end

  def categories 
    response = connection.get('jokes/categories')
    JSON.parse(response.body, symbolize: true)
  end

  def search(query)
    response = connection.get("jokes/search?query=#{query}")
    JSON.parse(response.body, symbolize: true)
  end
end

# https://api.chucknorris.io/jokes/random