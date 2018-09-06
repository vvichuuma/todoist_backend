class Api::ItemsController < ApplicationController


  def index

     @list = List.find_by(id:11).items


     render "index.json.jbuilder"

  end


  def magic

    @list = List.find_by(id: params[:id])


    @magic = @list.items


     render "magic.json.jbuilder"

  end 

  def create
    
    
     @item = Item.new(

         name:params["name"],
         list_id: params["list_id"]

      )

    if @item.save 

       render "show.json.jbuilder"

     else 

       render json:{errors: @item.errors.full_messages}, status: :bad_request

     end 


  end 



  def creatempitem
    params[:items].each do |item|
      @item = Item.new(
        name: item, 
        list_id: params[:list_id]
      )
      @item.save
    end
    render json: {message: "Success..."}
    # @item = Item.new(

    #   item1: params['item1'],
    #     item2: params['item2'],
    #       item3: params['item3'],
    #         item4: params['item4'],
    #           item5: params['item5'],
    #             item6: params['item6'],

    #          list_id: params['list_id']

    #   )


    #   if @item.save 

    #      render "multiple.json.jbuilder"

    #   end 




  end 




end
