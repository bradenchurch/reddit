Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'subs#index'


  resources :subs do    #creates 8 ish lines of code way easier ex: index show edit create destroy 
    resources :topics do #embed child inside of the parent
    #   resources :comments
    end 

    # resources :topics do 
    #   resources :comments
  end

  # http verb 'url pattern' to: 'controller#action' <final destination
  # :id placeholder for actual id 
# get '/people', to: 'people#index'
  # "/subs/3"

end
