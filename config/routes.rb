RailsImdb::Application.routes.draw do
  root :to => 'home#index', as: 'home'
  # resources :movies

  get '/movies'               => 'movies#index', as: 'movies'
  post '/movies/create'       => 'movies#create', as: 'create_it'
  # post '/movies/fav'        => 'movies#fav', as: 'fav_it'
  get '/movies/new'           => 'movies#new', as: 'new_movie'

  get '/movies/new/detail'    => 'movies#view_detail', as: 'view_detail' # CUSTOM MADE
  get '/movies/savedalready'  => 'movies#saved_already', as: 'saved_already' # CUSTOM MADE

  get '/movies/:id/edit'      => 'movies#edit', as: 'edit_movie'
  get '/movies/:id'           => 'movies#show', as: 'movie'
  put '/movies/:id'           => 'movies#update'
  delete '/movies/:id'        => 'movies#destroy'


#     root        /                          home#index
#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy


end
