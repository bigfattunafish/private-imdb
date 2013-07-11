RailsImdb::Application.routes.draw do
  root :to => 'home#index', as: 'home'

  get '/movies'               => 'movies#index', as: 'movies'
  post '/movies/create'       => 'movies#create', as: 'create_it'
  get '/movies/new'           => 'movies#new', as: 'new_movie'

  get '/movies/search'        => 'movies#search', as: 'search_movies'
  put '/movies/voteup'        => 'movies#vote_up', as: 'vote_up'
  put '/movies/votedown'      => 'movies#vote_down', as: 'vote_down'
  put '/movies/favit'         => 'movies#fav_it', as: 'fav_it'
  get '/movies/new/detail'    => 'movies#view_detail', as: 'view_detail'
  get '/movies/savedalready'  => 'movies#saved_already', as: 'saved_already'

  get '/movies/:id/edit'      => 'movies#edit', as: 'edit_movie'
  get '/movies/:id'           => 'movies#show', as: 'movie'
  put '/movies/:id'           => 'movies#update', as: 'update_movie'
  delete '/movies/:id'        => 'movies#destroy', as: 'delete_movie'


  get '/actors'               => 'actors#index', as: 'actors'
  get '/actors/:id'           => 'actors#show', as: 'actor'

end


