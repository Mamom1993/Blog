Rails.application.routes.draw do

	resources :articles

	resources :articles do
  		resources :comments
	end

	root 'articles#index'

end


