Rails.application.routes.draw do
	devise_for :users
	
	root controller: :rooms, action: :index

  resources :room_mesages
  resources :rooms
end
