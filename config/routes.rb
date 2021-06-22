Rails.application.routes.draw do
  # get 'pictures/index'
  get 'users/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show ,:edit, :update] do
    get :bookmark, on: :collection
  end
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :pictures, except: [:index] do
    resource :bookmarks, only: [:create, :destroy,]
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
