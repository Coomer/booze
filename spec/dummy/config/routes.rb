Rails.application.routes.draw do

  root to: "bikes#index"
  get "count" => "bikes#count"

end
