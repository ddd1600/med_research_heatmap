BootstrapRspecLibioCloneApp::Application.routes.draw do  
  
  resources :heat_spreadsheets
  resources :sessions
  resources :spreadsheets
  resources :users
  match "sample_heat_map" => "charts#sample_heat_map"
  match "heat_map" => "charts#heat_map"
  match "logout" => "sessions#destroy"
  match "login" => "sessions#new"
  root :to => "sessions#new"
end
