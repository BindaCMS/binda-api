Rails.application.routes.draw do
  get 'maintenance', to: 'maintenance#index', as: 'maintenance'
  

  mount Binda::Engine => '/admin_panel'
  mount Binda::Api::Engine => "/binda-api"
end
