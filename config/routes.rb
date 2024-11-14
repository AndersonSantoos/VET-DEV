Rails.application.routes.draw do
  resources :veterinarios, only: [:index, :show, :create, :destroy, :update]
  resources :animals, only: [:index, :show, :create, :destroy, :update]
  resources :tutors, only: [:index, :show, :create, :destroy, :update]
  resources :consultas, only: [:index, :show, :create, :destroy, :update]
  resources :prescricao_medicas, only: [:index, :show, :create, :destroy, :update]
  resources :sessoes, only: [:create, :destroy] # Para login e logout
 





  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
