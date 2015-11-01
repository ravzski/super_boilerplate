Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    resource :session, only: %i(show create destroy)
  end

  get "*path" => "application#index"
  root to: "application#index"
end
