BootstrapRspecLibioCloneApp::Application.routes.draw do  
  resources :spreadsheets
  resources :users
  match "heat_map" => "charts#heat_map", :as => "heat_map"
  root :to => "spreadsheets#index"
end
