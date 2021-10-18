Rails.application.routes.draw do
  get 'admin/index'
  get 'welcome/index'
  get 'admin/search'
  get 'admin/add'
  get 'patron/search'
  post 'patron/searchresults'
  resources :books do
    resources :reviews
    collection do
      post 'search'
    end
    member do
      patch 'checkout'
    end
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
