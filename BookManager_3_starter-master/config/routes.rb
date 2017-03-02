BookManager3::Application.routes.draw do
 
  # Generated model routes
  resources :books
  # need routes for authors and categories ...
  
  # Additional routes we've created for this project
  get 'proposed' => 'books#proposed', as: :proposed_books
  get 'contracted' => 'books#contracted', as: :contracted_books
  
  # Set the root url
  root to: 'books#index', as: :home

end
