Rails.application.routes.draw do
  namespace :v1 do

    namespace :movilidad do
      resources :bicycle_stations, path: 'estaciones-ecobici', only: [:index, :show]
      resources :vehicles, path: 'vehiculos', only: [:index, :show]
      resources :semovi_taxis, path: 'taxis', only: [:index, :show]
    end

    namespace :aire do
      resources :air_qualities, path: 'calidad-actual', only: [:index]
    end

    namespace :finanzas do
      resources :linea_captura
      resources :pagos, only: [] do
        get :consulta, on: :collection
      end
    end

  end
  resources :testamentos, only: [:index, :show]

  resources :corralones, only: [:index, :show]
end
