Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  get 'home/index'
  get 'forms/xrd'
  get 'know/xrd'
  get 'records/record'
  get 'admin_portal/admindashboard'
  get 'forms/three'
  get 'forms/lcms'
  get 'forms/raman'
  get 'forms/tga'

  devise_scope :user do
  root to: "devise/sessions#new"
end
devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
end

end
