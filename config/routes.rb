Rails.application.routes.draw do
  devise_for :users , :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "questions#index"
  resources :users, only:[:show, :edit, :update]
  resources :questions, only: [ :index, :create, :destroy, :show ] do
    resources :answers, only: [ :destroy ] do
    	member do
    		post :answer_upvote
    	end
    end

    member do
    	post :question_upvote
    end

    member do
      post :favorite
      post 'answers'     => 'answers#create'
    end
    #resources :answers, only: [ :create, :destroy ] 會抓不到question_id, 不知為何
  end
  resources :favorites, only:[ :index ]

end
