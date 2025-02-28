class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # READ - List all tasks
  def index
    @tasks = Task.all
  end

  # READ - Show a single task
  def show
  end

  # CREATE - New task form
  def new
    @task = Task.new
  end

  # CREATE - Save new task
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new
    end
  end

  # UPDATE - Edit form
  def edit
  end

  # UPDATE - Save updates
  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  # DELETE - Remove task
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully deleted."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
