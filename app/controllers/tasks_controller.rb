class TasksController < ApplicationController
  before_action :set_task, only: %i[show update edit destroy]
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      flash[:success] = '正常に作成されました。'
      redirect_to @task
    else
      flash.now[:danger] = '作成されませんでした。'
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = '正常に更新されました。'
      redirect_to @task
    else
      flash.now[:danger] = '更新されませんでした。'
      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = '正常に削除されました。'
      redirect_to root_path
    else
      flash.now[:danger] = '削除されませんでした。'
      render :show
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :detail)
  end
end
