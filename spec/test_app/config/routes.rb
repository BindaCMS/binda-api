Rails.application.routes.draw do
  mount Binda::Api::Engine => "/binda-api"
end
