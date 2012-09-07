Kb::Application.routes.draw do
  resources :comments

  resources :snippet_types
  resources :snippets
  root :to => 'home#index'
end
