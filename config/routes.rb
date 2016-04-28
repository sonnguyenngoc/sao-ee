Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "home#index"
    get "home" => "home#sao", as: :sao
    get "contact" => "contact#index", as: :contact
    get "about_us" => "about_us#index", as: :about_us
    get "project" => "project#index", as: :project
    get "project/detail" => "project#detail", as: :detail
    get "news" => "news#index", as: :news
    get "news/detail" => "news#detail", as: :news_detail
    
    # resources
    resources :newsletters
    
    #post "contacts/send" => "contacts#contact", as: :send
    resources :contacts do
      collection do
        post "send"
      end
    end
    devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
    resources :carts
    resources :line_items
    resources :customers
    resources :orders
    resources :wish_lists
    resources :line_item_compares
    resources :compares
    #end of resources
  
    namespace :admin, path: "hkpanel" do
      get "/" => "main#index"
      resources :shopping_carts
      resources :products do
        collection do
          get 'search'
        end
      end
      resources :categories do
        collection do
          get 'search'
          get 'update_parent_order'
        end
      end
      resources :manufacturers do
        collection do
          get 'search'
        end
      end
      resources :articles do
        collection do
          get 'search'
        end
      end
      resources :article_categories do
        collection do
          get 'search'
        end
      end
      resources :areas do
        collection do
          get 'search'
        end
      end
      resources :orders do
        collection do
          get 'search'
        end
      end
      resources :newsletters
      resources :contacts
      resources :wish_lists
      resources :payment_methods
      resources :delivery_methods
    end
  end
end
