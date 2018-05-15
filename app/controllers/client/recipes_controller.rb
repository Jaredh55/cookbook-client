class Client::RecipesController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/recipes")
    @recipes = response.body
     #no database, must reference other side
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        prep_time: params[:prep_time]
                      }
    response = Unirest.post(
                            "http://localhost:3000/api/recipes", parameters: client_params
                            )
    render 'create.html.erb'
  end

  def show
    recipe_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/recipes/#{recipe_id}")
    @recipe = response.body #hash
    render 'show.html.erb'
  end

  def edit
    @recipe_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/recipes/#{@recipe_id}")
    @recipe = response.body
    render 'edit.html.erb'
  end

  def update
        client_params = {
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        prep_time: params[:prep_time]
                      }
     response = Unirest.patch(
                             "http://localhost:3000/api/recipes/#{ params[:id] }",
                             parameters: client_params
                            )
        render 'update.html.erb'
  end

  def destroy
    recipe_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/recipes/#{ recipe_id }")
    render 'destroy.html.erb'
  end


end
