Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rock_photos
  resources :rocks, except: [:show]
  resources :samples, except: [:show]
  resources :sample_photos, except: [:show]
  resources :structure_photos, except: [:show]
  resources :structures, except: [:show]
  resources :outcrops, except: [:show]
  resources :outcrop_photos, except: [:show]
  resources :stages, except: [:show]
  resources :rock_structure_associations, except: [:show]
  resources :projects, except: [:show]
  resources :users, except: [:show]

  delete 'projects', controller: 'projects', action: 'destroy'
  delete 'rocks', controller: 'rocks', action: 'destroy'
  delete 'samples', controller: 'samples', action: 'destroy'
  delete 'structures', controller: 'structures', action: 'destroy'
  delete 'stages', controller: 'stages', action: 'destroy'
  delete 'users', controller: 'users', action: 'destroy'
  delete 'outcrops', controller: 'outcrops', action: 'destroy'
  delete 'rock_structure_associations', controller: 'rock_structure_associations', action: 'destroy'


  delete 'outcrop_photos', controller: 'outcrop_photos', action: 'destroy'
  delete 'rock_photos', controller: 'rock_photos', action: 'destroy'
  delete 'sample_photos', controller: 'sample_photos', action: 'destroy'
  delete 'structure_photos', controller: 'structure_photos', action: 'destroy'

  get 'rock_photos/search/findById', controller: 'rock_photos', action: 'show'
  get 'rocks/search/findById', controller: 'rocks', action: 'show'
  get 'samples/search/findById', controller: 'samples', action: 'show'
  get 'sample_photos/search/findById', controller: 'sample_photos', action: 'show'
  get 'associations/search/findById', controller: 'rock_structure_associations', action: 'show'
  get 'structure_photos/search/findById', controller: 'structure_photos', action: 'show'
  get 'structures/search/findById', controller: 'structures', action: 'show'
  get 'outcrops/search/findById', controller: 'outcrops', action: 'show'
  get 'outcrop_photos/search/findById', controller: 'outcrop_photos', action: 'show'
  get 'stages/search/findById', controller: 'stages', action: 'show'
  get 'projects/search/findById', controller: 'projects', action: 'show'
  get 'users/search/findFirstByEmail', controller: 'users', action: 'show'
  get 'users/:id', controller: 'users', action: 'show_by_id'


  get 'outcrops/user_outcrops', controller: 'outcrops', action: 'user_outcrops'

  get 'rock_structure_associations/find_rock_structure_associations', controller: 'rock_structure_associations', action: 'find_rock_structure_associations'
  post 'rock_structure_associations/delete_rock_structure_association_by_rock', controller: 'rock_structure_associations', action:'delete_rock_structure_association_by_rock'

  get 'outcrop/:id/outcrop_photos', controller: 'outcrop_photos', action: 'list'
  get 'rock/:id/rock_photos', controller: 'rock_photos', action: 'list'
  get 'sample/:id/sample_photos', controller: 'sample_photos', action: 'list'
  get 'structure/:id/structure_photos', controller: 'structure_photos', action: 'list'

  post 'outcropPhotos', controller: 'outcrop_photos', action:'create'
  put 'outcropPhotos', controller: 'outcrop_photos', action:'update'
  post 'samplePhotos', controller: 'sample_photos', action:'create'
  put 'samplePhotos', controller: 'sample_photos', action:'update'
  post 'rockPhotos', controller: 'rock_photos', action:'create'
  put 'rockPhotos', controller: 'rock_photos', action:'update'
  post 'structurePhotos', controller: 'structure_photos', action:'create'
  put 'structurePhotos', controller: 'structure_photos', action:'update'

  post 'users/login', controller: 'users', action: 'login'

  put 'associations', controller: 'rock_structure_associations', action:'update'
  post 'associations', controller: 'rock_structure_associations', action:'create'
  get 'associations', controller: 'rock_structure_associations', action:'destroy'


  get 'statistics/photos_list',controller: 'statistics', action: 'photos_list'
  get 'statistics/sizes',controller: 'statistics', action: 'sizes'
  get 'statistics/altitudes', controller: 'statistics', action: 'altitudes'
  get 'statistics/stages_by_uf', controller: 'statistics', action: 'stages_by_uf'

  get 'projects/get_all_project_data', controller: 'projects', action: 'get_all_project_data'
end
