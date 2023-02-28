Rails.application.routes.draw do
  resources :low_fatigues
    resources :gaits
    resources :grindings
    resources :friction_stirs
    resources :frictions
    resources :multi_impact_testers
    resources :ball_mailings
    resources :glows
    resources :tribometers
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
    get 'slotbooker/xrd1'
    post 'slotbooker/xrd1'
    patch 'slotbooker/xrd1'
    get 'slotbooker/xrd2'
    get 'slotbooker/xrd3'
    get 'slotbooker/xrd4'
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
    get 'slotbooker/amr'
    get 'slotbooker/ionc'
    get 'slotbooker/trib'
    get 'slotbooker/glow'
    get 'slotbooker/ball'
    get 'slotbooker/ftnmr'
    get 'slotbooker/icp'
    get 'slotbooker/fric'
    get 'slotbooker/gait'
    get 'slotbooker/grind'
    get 'slotbooker/multi'
    get 'know/hr_fesem_carl'
    get 'know/hr_fesem_jeol'
    get 'know/three'
    get 'know/raman'
    get 'know/tga'
    get 'know/bet'
    get 'know/hr_lcms'
    get 'know/uv_vis'
    get 'know/cell_imaging'
    get 'know/atomic'
    get 'know/ft_nmr'
    get 'know/icp_ms'
    get 'know/advance_mod_rheo'
    get 'know/ion_chromatography'
    get 'know/integ_multirole'
    get 'know/scratch_indentation'
    get 'know/zeta'
    get 'know/high_temp_vac'
    get 'know/impedance'
    get 'know/tribometer'
    get 'know/scanner_3d'
    get 'know/gait'
    get 'know/spectro'
    get 'know/spark_oes'
    get 'know/glow_discharge'
    get 'know/ball_milling'
    get 'know/low_force_fatigue'
    get 'know/micro_edm'
    get 'know/axes_5'
    get 'know/multi_impact_test'
    get 'know/friction_stir'
    get 'know/electro_chem'
    get 'know/milli_q'
    get 'know/glove_box'
    get 'know/probe_sonicator'
    get 'know/ultra_centrifuge'
    get 'know/gas_sensing'
    get 'know/liq_nitrogen'
    get 'know/ansys'
    get 'know/auto_multi_speci_polish'
    get 'slotbooker/payment'
    get 'slotbooker/paymentD'
    get 'slotbooker/paymentC'
    get 'slotbooker/paymentS'
    get 'slotbooker/paymentP'
    get 'slotbooker/paymentM'
    get 'slotbooker/paymentU'
    devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
