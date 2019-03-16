Rails.application.routes.draw do
  resources :buildings, :floors, :sensors
  get "/status", to: "status#status"
end
