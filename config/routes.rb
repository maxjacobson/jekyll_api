JekyllApi::Application.routes.draw do
  root to: 'blogs#index'

  resources :blogs do
    collection do
      get '/' => 'blogs#root_redirect'
    end
    post :publish
  end

end
