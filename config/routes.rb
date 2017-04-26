Rails.application.routes.draw do

  get 'submissions/index'

  get 'submissions/new'

  get 'submissions/create'

  get 'submissions/destroy'

  get 'submission/index'

  get 'submission/new'

  get 'submission/create'

  get 'submission/destroy'

  root 'welcome#index'

  get '/login' => 'session#new'

  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy', as: :logout

  get '/my_courses' => 'courses#individual_view', as: :dashboard

  get '/enroll_course' => 'courses#enroll', as: :enroll_course

  get '/unenroll_course' => 'courses#unenroll', as: :unenroll_course

  get '/my_assignments' => 'assignments#individual_view', as: :my_assignments

  get '/submit_assignment' => 'submissions#new', as: :submit_assignment

  resources :assignments
  resources :courses
  resources :users
  resources :submissions

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
