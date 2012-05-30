Exceptions::Engine.routes.draw do
  # match  '/githook' => 'failures#github_callback', :via => [:get, :post]
  # match  '/gitauth' => 'failures#github_authorization', :via => [:get, :post]
  resources :failures
  root to: "failures#index"
end
