Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rock_photos
  resources :rocks
  resources :samples
  resources :sample_photos
  resources :rock_structure_associations
  resources :structure_photos
  resources :structures
  resources :outcrops
  resources :outcrop_photos
  resources :stages
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
