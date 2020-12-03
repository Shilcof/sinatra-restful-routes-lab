class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.update(params[:id],params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end

end


# new page '/recipes/new'
# responds with a 200 status code (FAILED - 5)
# contains a form to create the recipe (FAILED - 6)
# posts the form back to create a new recipe (FAILED - 7)

# creating a new recipe
# creates a new recipe and saves to the database (FAILED - 8)
# redirects to the recipe show page (FAILED - 9)

# updating a recipe
# updates the recipe (FAILED - 10)
# redirects to the recipe show page (FAILED - 11)

# deleting a recipe
# deletes a recipe (FAILED - 12)