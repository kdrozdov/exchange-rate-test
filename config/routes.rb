Rails.application.routes.draw do
  root to: "pages#home"

  namespace :admin do
    resources :exchange_rates, only: %(create)
    root to: "exchange_rates#edit"
  end
end
