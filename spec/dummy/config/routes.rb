Rails.application.routes.draw do

  root to: "bikes#index"
  get "count" => "bikes#count"
  get "no_layout" => "bikes#no_layout"

end
