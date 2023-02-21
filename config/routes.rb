Rails.application.routes.draw do
   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   default_url_options :host => "localhost:3000"
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


    devise_for :users
    get 'home/index'
    get 'know/xrd'
    get 'records/record'
    get 'admin_portal/admindashboard'
    get 'admin_portal/slotdashboard'
    get 'slotbooker/xrd'
    get 'slotbooker/atomic'
    get 'slotbooker/bet'
    get 'slotbooker/cell'
    get 'slotbooker/fesemc'
    get 'slotbooker/fesemj'
    get 'slotbooker/icp'
    get 'slotbooker/laser'
    get 'slotbooker/lcms'
    get 'slotbooker/raman'
    get 'slotbooker/tga'
    get 'slotbooker/threednon'
    get 'slotbooker/uv'
    get 'slotbooker/xrd'
    get 'slotbooker/ftnmr'
    get 'slotbooker/icp'

    devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
