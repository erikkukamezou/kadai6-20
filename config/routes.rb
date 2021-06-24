Rails.application.routes.draw do
  get 'bookmarks_users/index'
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
  # resources :pictures, except: [:index] do
    resources :bookmarks, only: [:create, :destroy]
  # end

  resources :pictures, only: %i[index new create show edit destroy update], shallow: true do
    get :bookmarks, on: :collection
    resource :bookmarks, only: %i[create destroy bookmark]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
