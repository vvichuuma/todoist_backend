Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :api do 

     get"/tasks" => "tasks#index"
     post "/tasks" => "tasks#create"
      post "/users" => "users#create"

      get "/tas" => "tasks#user_name"

      
      get "/usertas" => "tasks#user_task"


       post "/sessions" => "sessions#create"

      get "/weather" => "tasks#d_weather"

       post "/weather" => "tasks#weather"
 

       delete "/tasks/:id" => "tasks#destroy"

       
       get "/sdate" => "tasks#sortdate"

       
      patch "/taskup/:id" => "tasks#update"



     # lists
      

       get "/lists" => "lists#index"

       post "/list" => "lists#create"

       delete "/lisdel/:id" => "lists#destroy"


      #ListItems:

      get "/items" => "items#index"


      post "/item" => "items#create"


      post "/magic" => "items#magic"

      post "/senditem" => "items#creatempitem"

      delete "/delete" => "items#delete"

    #Find TAsks according to dates: 


      post "/dates" => "tasks#finddate"

    patch "/uppt/:id" => "tasks#findtask"


    delete "/deltas/:id" => "tasks#deltas"



    #get Geolocation

    post "/locate" => "tasks#geolocation"




   end 



end
