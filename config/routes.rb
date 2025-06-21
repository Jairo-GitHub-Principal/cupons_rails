Rails.application.routes.draw do
  resources :cupons do   # define as rotas altomatica de restful para o recurso cupons "que é a estrutura mvc gerada pelo scaffold cupons"
          member do     # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
            get :validar 
          end
  end 
    root "cupons#index" #root define a página inicial (home#index) do projeto reails


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end


