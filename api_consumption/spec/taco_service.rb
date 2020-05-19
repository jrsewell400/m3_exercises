class TacoService
  def connection
    Faraday.new(url: 'http://taco-randomizer.herokuapp.com')
  end

  def random_ingredients
    response = connection.get('/random/')
    JSON.parse(response.body, symbolize: true)
  end

  def random_taco
    response = connection.get('/random/?full-taco=true')
    JSON.parse(response.body, symbolize: true)
  end

  def contributions(username)
    response = connection.get("/contributions/#{username}/")
    JSON.parse(response.body, symbolize: true)
  end

  def ingredients_by_type(recipe_type)
    response = connection.get("/contributors/#{recipe_type}/")
    JSON.parse(response.body, symbolize: true)
  end

  def contributors_by_ingredient(recipe_type, slug_type)
    response = connection.get("/contributors/#{recipe_type}/#{slug_type}/")
    JSON.parse(response.body, symbolize: true)
  end
end