Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'csv_files#index'

   get 'csv_files/index'
   get 'csv_files/show'


   get 'csv_files/import' => 'csv_files#my_import'

   resources :csv_files do
     collection {post :import}
  end

end
