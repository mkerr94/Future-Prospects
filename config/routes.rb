Rails.application.routes.draw do

  resources :offers
  get 'applications/show'

  get 'applications/create'

devise_for :colleges, :controllers => { :registrations => 'colleges/registrations' }
resources :colleges, :only => [ :show, :index ]
devise_for :staffs, :controllers => { :registrations => 'staffs/registrations' }
resources :staffs, :only => [ :show ]
devise_for :users, :controllers => { :registrations => 'users/registrations' }
resources :users, :only => [ :show, :index]
resources :courses
resources :categories, except: [:destroy]
resources :applications
resource :order

root 'pages#home'
get 'about', to: 'pages#about'
get 'register_choice', to: 'pages#register_choice'
get 'login_choice', to: 'pages#login_choice'
get 'college_applications', to: 'colleges#college_applications'
get 'college_courses', to: 'colleges#college_courses'
get 'college_offers', to: 'colleges#college_offers'
get 'course_applications', to: 'courses#course_applications'
get 'user_offers', to: 'users#user_offers'
get 'accept_offer', to: 'offers#accept'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
