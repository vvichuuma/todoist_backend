class Api::ListsController < ApplicationController


   def index 


     @user = User.find_by(id: current_user.id);

     @user = @user.lists


    # @lists = List.all

    render "index.json.jbuilder"

   end 

   def create


     @list = List.new(

         name:params["name"],
         user_id: current_user.id

      )


     if @list.save 

       render "show.json.jbuilder"

     else 

       render json:{errors: @list.errors.full_messages}, status: :bad_request

     end 


   end 



   def destroy
     
      @list = List.find_by(id:params["id"])

      @list.destroy


       render json:{message:"The List has been removed"}


   end 




end
