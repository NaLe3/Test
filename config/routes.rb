Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

   get 'users/index'

   get 'users/import' => 'users#my_import'

   resources :users do
     collection {post :import}
  end

end
