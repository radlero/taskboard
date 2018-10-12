class TasksController < ApplicationController
http_basic_authenticate_with name: "rad", password: "123", except: [:index, :show]
  def index
      @tasks = Task.all
    end
  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end
def create
      @task = Task.new(task_params)

      @task.save
      redirect_to @task
end

def destroy
  @task = Task.find(params[:id])
  @task.destroy

  redirect_to tasks_path
end

def update
  @task= Task.find(params[:id])

  if @task.update(task_params)
    redirect_to @task
  else
    render 'edit'
  end
end
      private
  def task_params
    params.require(:task).permit(:task, :time, :station, :importance)

  end
  end