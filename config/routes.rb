Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rock_photos, except: [:show]
  resources :rocks, except: [:show]
  resources :samples, except: [:show]
  resources :sample_photos, except: [:show]
  resources :rock_structure_associations, except: [:show]
  resources :structure_photos, except: [:show]
  resources :structures, except: [:show]
  resources :outcrops, except: [:show]
  resources :outcrop_photos, except: [:show]
  resources :stages, except: [:show]
  resources :projects, except: [:show]
  resources :users, except: [:show]

  get 'rock_photos/search/findById', controller: 'rock_photos', action: 'show'
  get 'rocks/search/findById', controller: 'rocks', action: 'show'
  get 'samples/search/findById', controller: 'samples', action: 'show'
  get 'sample_photos/search/findById', controller: 'sample_photos', action: 'show'
  get 'rock_structure_associations/search/findById', controller: 'rock_structure_associations', action: 'show'
  get 'structure_photos/search/findById', controller: 'structure_photos', action: 'show'
  get 'structures/search/findById', controller: 'structures', action: 'show'
  get 'outcrops/search/findById', controller: 'outcrops', action: 'show'
  get 'outcrop_photos/search/findById', controller: 'outcrop_photos', action: 'show'
  get 'stages/search/findById', controller: 'stages', action: 'show'
  get 'projects/search/findById', controller: 'projects', action: 'show'
  get 'users/search/findFirstByEmail', controller: 'users', action: 'show'




end
