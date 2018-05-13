class Client::RecipesController < ApplicationController
  def action
    response = Unirest.get("http://localhost:3000/api/recipes")
    @recipes = response.body
     #no database, must reference other side
    render 'index.html.erb'
  end
end
