class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new( title: params[:task][:title], done: params[:task][:done])
    @task.save
    redirect_to(tasks_path)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update( title: params[:task][:title], done: params[:task][:done])
    @task.save
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(tasks_path)
  end
end
