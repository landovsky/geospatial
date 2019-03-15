Rails.application.routes.draw do
  resources :buildings, :floors, :sensors
end
