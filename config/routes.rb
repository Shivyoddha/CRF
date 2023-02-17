Rails.application.routes.draw do
  resources :zeta_potential_sizes
  resources :scratch_indentations
  resources :integrated_multi_role_testers
  resources :ion_chromotographies
  resources :advance_molecular_rheometers
  resources :icp_ms
  resources :ft_nmrs
  resources :atomic_force_microscopes
  resources :cell_imagings
  resources :uv_vis_nirs
  resources :hrlcms
  resources :bets
  resources :tga_fttrs
  resources :raman_microscopes
  resources :three_d_non_contacts
  resources :hr_fesem_js
  resources :hr_fesem_cs
  resources :xrds
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  get 'home/index'
  get 'know/xrd'
  get 'records/record'
  get 'admin_portal/admindashboard'
  get 'admin_portal/slotdashboard'
  devise_scope :user do
  root to: "devise/sessions#new"
end
devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
end

end
