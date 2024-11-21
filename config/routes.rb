Rails.application.routes.draw do
  resources :veterinarios, only: [:index, :show, :create, :destroy, :update]
  
  resources :animals, only: [:index, :show, :create, :destroy, :update]
  
  resources :tutors, only: [:index, :show, :create, :destroy, :update] do
    # Rota aninhada para listar os animais do tutor
    get 'animals', to: 'animals#by_tutor'
  end
 
  resources :consultas, only: [:index, :show, :create, :destroy, :update] do
    # Rota para listar todas as consultas de um veterinário específico
    get 'veterinario/:veterinario_id', to: 'consultas#by_veterinario', on: :collection
  end
  
  resources :consultas, only: [:index, :show, :create, :destroy, :update] do
    # Nova rota para listar todas as prescrições médicas de uma consulta
    get 'prescricoes', to: 'prescricao_medicas#by_consulta'
  end
  
  resources :sessoes, only: [:create, :destroy] # Para login e logout
  
  get '/api-docs' => 'swagger#index' 
  get '/swagger-ui' => 'swagger_ui#index' 
  get '/swagger-ui/*path' => 'swagger_ui#show'



  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
