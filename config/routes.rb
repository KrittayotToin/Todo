Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/message", to: "message#home", as: "message_home" 
  get "/history_message", to: "message#get_history", as: "message_history" 
  post "/add_message", to: "message#create", as: "add_message"
   delete "/message/:id", to: "message#destroy", as: "delete_message"
end
