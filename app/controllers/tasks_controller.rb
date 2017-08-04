class TasksController < ApplicationController
  def index
    @incomplete_tasks = Task.where(complete: false)
    @complete_tasks = Task.where(complete: true)
  end

  def new
  	p "CREA" * 20
    @task = Task.new
  end

  def create
  	p "ENTRA A CREATE" * 10
    @task = Task.create!(allowed_params)

    #redirect_to tasks_url
    respond_to do |f|
    	f.html { redirect_to tasks_url }
    	f.js
  	end
  end

  def update
  	p "UPDATE++++" * 20
    @task = Task.find(params[:id])
    @task.update_attributes!(allowed_params)

    #redirect_to tasks_url
    respond_to do |f|
    	f.html { redirect_to tasks_url }
    	f.js
  	end
  end

  def destroy
  	p "DESTROY" * 20
    @task = Task.destroy(params[:id])

    #redirect_to tasks_url
    respond_to do |f|
    	f.html { redirect_to tasks_url }
    	f.js #{ location: tasks_url }
  	end

  end

  private

  def allowed_params
    params.require(:task).permit(:name, :complete)
  end
end
