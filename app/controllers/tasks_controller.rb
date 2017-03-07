class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    set_task
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
    set_task
  end

  def update
    @task.update( title: params[:task][:title], done: params[:task][:done])
    @task.save
    redirect_to(tasks_path)
  end

  def destroy
    set_task
    @task.destroy
    redirect_to(tasks_path)
  end

  private

  def set_task
      @task = Task.find(params[:id])
  end
end
