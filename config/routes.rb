Rails.application.routes.draw do
  namespace :client do
    get '/recipes' => 'recipes#action'
  end
end
