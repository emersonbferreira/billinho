Rails.application.routes.draw do
  resources :invoices
  devise_for :users
  resources :enrollments
  resources :students
  resources :institutions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
