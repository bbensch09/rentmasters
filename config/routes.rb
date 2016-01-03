Rails.application.routes.draw do
  get 'welcome/index'
  get '/index' => 'welcome#index'
  get '/privacy_policy' => 'welcome#privacy_policy'
  get '/terms_of_service' => 'welcome#terms_of_service'
  get '/market_rents' => 'market_rents#index'
  get '/quotes' => 'quotes#404' #serve custom 404 if user removes quote id
  get '/quotes-admin-index-5567' => 'quotes#index' #insecure random URL for BB's admin access
  get '/quotes/thank_you' => 'quotes#thank_you'
  get '/login' => 'users#new'

  #ROUTE BELOW ALLOW THE QUOTE INDEXT PAGE LINKS TO WORK BUT THEN BREAKS THE NORMAL QUOTE SHOW
  #DEPRIORITIZING JAN1-2016
  # get 'quotes/new' => 'quotes#new'
  # get 'quotes/:slug' => 'quotes#show', as: 'quotes_slug'

  # get '/session-viewer' do 
  #   session.inspect
  # end

  resources :quotes
  resources :users
  resources :market_rents do
    collection { post :import}
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

end
