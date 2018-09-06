class Api::TasksController < ApplicationController

  # before_action :authenticate_user , except:[:index]

  def index 
    @tasks = Task.all 
  
     render "index.json.jbuilder"
  end 

  def user_name 
   
   @user = User.find_by(id:current_user.id)

   render "user.json.jbuilder"

  end 

  def user_task
    @user = User.find_by(id:current_user.id)
    @tasks = @user.tasks
    if params[:today]
      @tasks = @tasks.select { |task| task.date == Date.today }
    end
    render "user_task.json.jbuilder"
  end 


  def create
     
     @task = Task.new(

        name:params[:name],
        date:params[:date],
        time:params[:time],
        user_id:current_user.id

      )

     if @task.save

       render "show.json.jbuilder"
     else 
       render json: {errors: @task.errors.full_messages}, status: :bad_request

 
     end  



  end 



  def d_weather
    
    response = Unirest.get("https://api.weatherbit.io/v2.0/current?city=Chicago&key=#{ENV["API_KEY"]}")

    render json: response.body
 
 
  end 

  def weather

     response = Unirest.get("https://api.weatherbit.io/v2.0/current?city=#{params['city_n']}&key=#{ENV["API_KEY"]}")

     render json: response.body

  end 



  def destroy 

    @task = Task.find_by(id:params["id"])

    @task.destroy

    render json:{message:"THe Task has been removed"}

  end 



def update

 
  @task = Task.find_by(id:params[:id])

  @task.name = params["name"] || @task.name 

  @task.time = params["time"] || @task.time 

  @task.date = params["date"] || @task.date
 
  if @task.save 

  render "update.json.jbuilder"
  
  else   

    render json: {errors: @task.errors.full_messages}, status: :bad_request

 
   end  


end


def findtask 


  @task = Task.find_by(id:params["id"])


  @task.name = params["name"] || @task.name 

  @task.time = params["time"] || @task.time



  if @task.save

  render "updateToday.json.jbuilder"

  else 

  render json: {errors: @task.errors.full_messages}, status: :bad_request


  end 



end 


def finddate 

  @task = Task.where(date:params[:date])



 # render json:{message:"Vishnu is a programmer"}


  render "datetask.json.jbuilder"


end 


def deltas 

    @task = Task.find_by(id:params["id"])

    if @task.destroy
      
      render json:{message:"The Task has been removed"}

    end 




end 









end
