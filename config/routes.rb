Rails.application.routes.draw do
  resources :feedbacks
  resources :announcements
  resources :equiplists
  get 'equips/index'
  get 'equips/show'
  get 'equips/new'
  get 'equips/create'
  get 'equips/destroy'
  post 'mainportal/adminModelEquip'
  post 'mainportal/adminModelUsers'
  root 'mainpage#landing'
  post 'mainportal/chairmanStats'
  post 'mainportal/chairmanStatsPayment'
  post 'mainportal/chairmanStatsSamples'




  resources :ft_nms
  resources :ansies
  resources :equipment_tables
  resources :lasers
  resources :three_d_scanners
  resources :impedance_analies
  resources :high_temp_vaccums
  resources :liquid_nitrogens
  resources :gas_sensings
  resources :ultra_centrifuges
  resources :probe_sonicators
  resources :glove_boxes
  resources :milli_qs
  resources :electro_chemicals
  resources :five_axis
  resources :micro_edms
  resources :spark_os
  resources :spectro_radio_meters
  resources :gaits
   resources :grindings
   resources :friction_stirs
   resources :frictions
   resources :multi_impact_testers
   resources :ball_mailings
   resources :glows
   resources :tribometers
   resources :low_fatigues
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
    resources :faculties, controller: 'faculties'

    devise_for :users

    post 'home/developer'
    get 'mainportal/admindashboard'
    get 'mainportal/adminModelUsers'
    get 'mainportal/adminModelEquip'
    get 'mainportal/adminModelEquipWeeks'
    get 'mainportal/adminModelPayment'
    get 'mainportal/adminStats'
    get 'mainportal/chairmanDashboard'
    get 'mainportal/chairmanStats'
    get 'mainportal/chairmanEquip'
    get 'mainportal/chairmanPayment'
    get 'mainportal/chairmanUsers'
    get 'mainportal/chairmanStatsPayment'
    get 'mainportal/chairmanStatsSamples'
    get 'mainpage/landing'
    get 'home/index'
    get 'home/myslots'
    get 'home/anish'
    get 'know/xrd'
    get 'records/record'

    get 'home/mainPage'
    get 'mainpage/people'
    get 'mainpage/user_type'
    get 'mainpage/about_us'
    get 'mainpage/gallery'
    get 'mainpage/facility'
    get 'mainpage/announcement_admin'

    get 'mainpage/micromachining'
    get 'mainpage/xrd'
    get 'mainpage/axes_5'
    get 'mainpage/metal_3D'
    get 'mainpage/friction_stir'
    get 'mainpage/hvaf_hvof'
    get 'mainpage/hollow_fibre'

    get 'mainpage/fesem_c'
    get 'mainpage/hr_fesem_jeol'
    get 'mainpage/hr_lcms'
    get 'mainpage/xrd'
    get 'mainpage/three'
    get 'mainpage/bet'
    get 'mainpage/uv_vis'
    get 'mainpage/rheometer'
    get 'mainpage/raman'
    get 'mainpage/scanner_3d'
    get 'mainpage/tribometer'
    get 'mainpage/icp_ms'
    get 'mainpage/gas_sensing'
    get 'mainpage/atomic'
    get 'mainpage/tga'
    get 'mainpage/cell_imaging'
    get 'mainpage/ft_nmr'
    get 'mainpage/spark_oes'
    get 'mainpage/scratch_indentation'
    get 'mainpage/glow_discharge'
    get 'mainpage/multi_impact_test'
    get 'mainpage/integ_multirole'
    get 'mainpage/zeta'
    get 'mainpage/pressure_plate'
    get 'mainpage/impedance'
    get 'mainpage/laser'
    get 'mainpage/ion_chromatography'
    get 'mainpage/spectro'
    get 'mainpage/low_force_fatigue'
    get 'mainpage/chemisorption'
    get 'mainpage/instrumented_impact'
    get 'mainpage/gas_chromatography'
    get 'mainpage/proton_transfer'
    get 'mainpage/servo_hydraulic'
    get 'mainpage/gait'

    get 'mainpage/auto_multi_speci_polish'
    get 'mainpage/electro_chem'
    get 'mainpage/ultra_centrifuge'
    get 'mainpage/milli_q'
    get 'mainpage/glove_box'
    get 'mainpage/probe_sonicator'
    get 'mainpage/uv_ozone'
    get 'mainpage/high_temp_vac'
    get 'mainpage/liq_nitrogen'
    get 'mainpage/ball_milling'

    get 'mainpage/instrument_list'
    get 'mainpage/ft_nmr'
    get 'mainpage/xrd'
    get 'mainpage/hr_fesem_carl'
    get 'mainpage/friction_wear'
    get 'mainpage/multi_impact_test'
    get 'mainpage/multirole_mech'

    get 'feedbacks/index'


   get 'slot_mailer/xrd'
   get 'slot_mailer/advance_molecular_rheometer'
   get 'slot_mailer/bet'
   get 'slot_mailer/ball_mailing'
   get 'slot_mailer/cell_imaging'
   get 'slot_mailer/electro_chemical'
   get 'slot_mailer/five_axi'
   get 'slot_mailer/friction'
   get 'slot_mailer/ftnmr'
   get 'slot_mailer/gait'
   get 'slot_mailer/gas_sensing'
   get 'slot_mailer/glove_box'
   get 'slot_mailer/glow'
   get 'slot_mailer/grinding'
   get 'slot_mailer/high_temp_vaccum'
   get 'slot_mailer/hr_fesem_c'
   get 'slot_mailer/hr_fesem_j'
   get 'slot_mailer/icp_m'
   get 'slot_mailer/hr_lcm'
   get 'slot_mailer/impedence_analyzer'
   get 'slot_mailer/integrated_multi_role_tester'
   get 'slot_mailer/ion_chromatography'
   get 'slot_mailer/liquid_nitrogen'
   get 'slot_mailer/low_fatigue'
   get 'slot_mailer/laser'
   get 'slot_mailer/micro_edm'
   get 'slot_mailer/milli_q'
   get 'slot_mailer/multi_impact_tester'
   get 'slot_mailer/probe_sonicator'
   get 'slot_mailer/raman_microscope'
   get 'slot_mailer/scratch_indentation'
   get 'slot_mailer/spark_o'
   get 'slot_mailer/spectro_radio_meter'
   get 'slot_mailer/tga_fttr'
   get 'slot_mailer/three_d_non_contact'
   get 'slot_mailer/three_d_scanner'
   get 'slot_mailer/tribometer'
   get 'slot_mailer/ultra_centrifuge'
   get 'slot_mailer/uv_vis_nir'
   get 'slot_mailer/zeta_potential_size'




















    get 'home/developer'
    get 'slotbooker/xrd'
    get 'slotbooker/xrd1'
    post 'slotbooker/xrd1'
    patch 'slotbooker/xrd1'
    get 'slotbooker/xrd2'
    get 'slotbooker/xrd3'
    get 'slotbooker/xrd4'
    get 'slotbooker/atomic'
    get 'slotbooker/atomic1'
    get 'slotbooker/atomic2'
    get 'slotbooker/atomic3'
    get 'slotbooker/atomic4'
    get 'slotbooker/bet'
    get 'slotbooker/bet1'
    get 'slotbooker/bet2'
    get 'slotbooker/bet3'
    get 'slotbooker/bet4'
    get 'slotbooker/cell'
    get 'slotbooker/cell1'
    get 'slotbooker/cell2'
    get 'slotbooker/cell3'
    get 'slotbooker/cell4'
    get 'slotbooker/fesemc'
    get 'slotbooker/fesemc1'
    get 'slotbooker/fesemc2'
    get 'slotbooker/fesemc3'
    get 'slotbooker/fesemc4'
    get 'slotbooker/fesemj'
    get 'slotbooker/fesemj1'
    get 'slotbooker/fesemj2'
    get 'slotbooker/fesemj3'
    get 'slotbooker/fesemj4'
    get 'slotbooker/icp'
    get 'slotbooker/icp1'
    get 'slotbooker/icp2'
    get 'slotbooker/icp3'
    get 'slotbooker/icp4'
    get 'slotbooker/laser'
    get 'slotbooker/laser1'
    get 'slotbooker/laser2'
    get 'slotbooker/laser3'
    get 'slotbooker/laser4'
    get 'slotbooker/lcms'
    get 'slotbooker/lcms1'
    get 'slotbooker/lcms2'
    get 'slotbooker/lcms3'
    get 'slotbooker/lcms4'
    get 'slotbooker/raman'
    get 'slotbooker/raman1'
    get 'slotbooker/raman2'
    get 'slotbooker/raman3'
    get 'slotbooker/raman4'
    get 'slotbooker/tga'
    get 'slotbooker/tga1'
    get 'slotbooker/tga2'
    get 'slotbooker/tga3'
    get 'slotbooker/tga4'
    get 'slotbooker/threednon'
    get 'slotbooker/threednon1'
    get 'slotbooker/threednon2'
    get 'slotbooker/threednon3'
    get 'slotbooker/threednon4'
    get 'slotbooker/uv'
    get 'slotbooker/uv1'
    get 'slotbooker/uv2'
    get 'slotbooker/uv3'
    get 'slotbooker/uv4'
    get 'slotbooker/spectro'
    get 'slotbooker/spectro1'
    get 'slotbooker/spectro2'
    get 'slotbooker/spectro3'
    get 'slotbooker/spectro4'
    get 'slotbooker/spark'
    get 'slotbooker/spark1'
    get 'slotbooker/spark2'
    get 'slotbooker/spark3'
    get 'slotbooker/spark4'
    get 'slotbooker/fiveaxis'
    get 'slotbooker/fiveaxis1'
    get 'slotbooker/fiveaxis2'
    get 'slotbooker/fiveaxis3'
    get 'slotbooker/fiveaxis4'
    get 'slotbooker/elctro'
    get 'slotbooker/elctro1'
    get 'slotbooker/elctro2'
    get 'slotbooker/elctro3'
    get 'slotbooker/elctro4'
    get 'slotbooker/nitrogen'
    get 'slotbooker/gassensing'
    get 'slotbooker/gassensing1'
    get 'slotbooker/gassensing2'
    get 'slotbooker/gassensing3'
    get 'slotbooker/gassensing4'
    get 'slotbooker/centrifuge'
    get 'slotbooker/centrifuge1'
    get 'slotbooker/centrifuge2'
    get 'slotbooker/centrifuge3'
    get 'slotbooker/centrifuge4'
    get 'slotbooker/probe'
    get 'slotbooker/probe1'
    get 'slotbooker/probe2'
    get 'slotbooker/probe3'
    get 'slotbooker/probe4'
    get 'slotbooker/glove'
    get 'slotbooker/glove1'
    get 'slotbooker/glove2'
    get 'slotbooker/glove3'
    get 'slotbooker/glove4'
    get 'slotbooker/bet'
    get 'slotbooker/bet1'
    get 'slotbooker/bet2'
    get 'slotbooker/bet3'
    get 'slotbooker/bet4'
    get 'slotbooker/milli'
    get 'slotbooker/integrated'
    get 'slotbooker/integrated1'
    get 'slotbooker/integrated2'
    get 'slotbooker/integrated3'
    get 'slotbooker/integrated4'
    get 'slotbooker/scratch'
    get 'slotbooker/scratch1'
    get 'slotbooker/scratch2'
    get 'slotbooker/scratch3'
    get 'slotbooker/scratch4'
    get 'slotbooker/threescanner'
    get 'slotbooker/threescanner1'
    get 'slotbooker/threescanner2'
    get 'slotbooker/threescanner3'
    get 'slotbooker/threescanner4'
    get 'slotbooker/impdeance'
    get 'slotbooker/impdeance1'
    get 'slotbooker/impdeance2'
    get 'slotbooker/impdeance3'
    get 'slotbooker/impdeance4'
    get 'slotbooker/zeta'
    get 'slotbooker/zeta1'
    get 'slotbooker/zeta2'
    get 'slotbooker/zeta3'
    get 'slotbooker/zeta4'
    get 'slotbooker/highvaccum'
    get 'slotbooker/highvaccum1'
    get 'slotbooker/highvaccum2'
    get 'slotbooker/highvaccum3'
    get 'slotbooker/highvaccum4'
    get 'slotbooker/amr'
    get 'slotbooker/amr1'
    get 'slotbooker/amr2'
    get 'slotbooker/amr3'
    get 'slotbooker/amr4'
    get 'slotbooker/ionc'
    get 'slotbooker/ionc1'
    get 'slotbooker/ionc2'
    get 'slotbooker/ionc3'
    get 'slotbooker/ionc4'
    get 'slotbooker/trib'
    get 'slotbooker/trib1'
    get 'slotbooker/trib2'
    get 'slotbooker/trib3'
    get 'slotbooker/trib4'
    get 'slotbooker/glow'
    get 'slotbooker/glow1'
    get 'slotbooker/glow2'
    get 'slotbooker/glow3'
    get 'slotbooker/glow4'
    get 'slotbooker/ball'
    get 'slotbooker/ball1'
    get 'slotbooker/ball2'
    get 'slotbooker/ball3'
    get 'slotbooker/ball4'
    get 'slotbooker/icp'
    get 'slotbooker/icp1'
    get 'slotbooker/icp2'
    get 'slotbooker/icp3'
    get 'slotbooker/icp4'
    get 'slotbooker/fric'
    get 'slotbooker/fric1'
    get 'slotbooker/fric2'
    get 'slotbooker/fric3'
    get 'slotbooker/fric4'
    get 'slotbooker/gait'
    get 'slotbooker/gait1'
    get 'slotbooker/gait2'
    get 'slotbooker/gait3'
    get 'slotbooker/gait4'
    get 'slotbooker/grind'
    get 'slotbooker/grind1'
    get 'slotbooker/grind2'
    get 'slotbooker/grind3'
    get 'slotbooker/grind4'
    get 'slotbooker/multi'
    get 'slotbooker/multi1'
    get 'slotbooker/multi2'
    get 'slotbooker/multi3'
    get 'slotbooker/multi4'
    get 'slotbooker/laser'
    get 'slotbooker/laser1'
    get 'slotbooker/laser2'
    get 'slotbooker/laser3'
    get 'slotbooker/laser4'
    get 'slotbooker/ftnmr'
    get 'slotbooker/low'
    get 'slotbooker/low1'
    get 'slotbooker/low2'
    get 'slotbooker/low3'
    get 'slotbooker/low4'
    get 'slotbooker/microedm'
    get 'slotbooker/microedm1'
    get 'slotbooker/microedm2'
    get 'slotbooker/microedm3'
    get 'slotbooker/microedm4'
    get 'slotbooker/ftnmr'
    get 'slotbooker/ftnmr1'
    get 'slotbooker/ftnmr2'
    get 'slotbooker/ftnmr3'
    get 'slotbooker/ftnmr4'
    get 'slotbooker/ansy'
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
    get 'know/laser'
    get 'know/auto_multi_speci_polish'
    get 'payment/payment'
    get 'payment/paymentD'
    get 'payment/paymentDc'
    get 'payment/paymentC'
    get 'payment/paymentCc'
    get 'payment/paymentS'
    get 'payment/paymentSc'
    get 'payment/paymentP'
    get 'payment/paymentPc'
    get 'payment/paymentM'
    get 'payment/paymentU'
    get 'payment/paymentA'
    get 'payment/paymentExt'
    get 'payment/paymentExtR'
    get 'payment/paymentExtM'
    get 'payment/paymentExtC'
    get 'payment/paymentExtU'
    get 'payment/payment_completed'
    get 'payment/proforma_confirmation'
    post 'payment/paymentU'
    post 'payment/paymentM'
    post 'payment/paymentExtU'
    post 'payment/paymentExtM'
    get 'home/faculty_verif'
    post 'home/faculty_verif'
    get 'home/verifsent'
    post 'home/verifsent'
    get 'home/maithu'
    get 'payment/generate_pdf', as: :generate_pdf

    get 'mainportal/importfile'

  #   devise_scope :user do
  #   root to: "devise/sessions#new"
  # end/

  resources :equiplists do
  collection do
    post :import
  end
end

resources :announcements do
collection do
  post :import
end
end

resources :feedbacks do
collection do
  post :import
end
end

resources :faculties do
collection do
  post :import
end
end

resources :xrds do
collection do
  post :import
end
end

resources :hr_fesem_cs do
collection do
  post :import
end
end

post 'import_users', to: 'application#import_users'


  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
      # match '*unmatched', to: 'application#render_404', via: :all,constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
  end
#
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
