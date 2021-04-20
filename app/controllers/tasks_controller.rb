# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :edit, :destroy]

  # 全てのタスクモデルをテーブルから取得。
  def index
    @tasks = Task.all
  end

  # パラメータからidを取得しidに合致するタスクを取得。
  # @param [integer] id タスクのID
  def show; end

  # 新しいタスクインスタンスを作成。
  # @return [object] @task タスクインスタンス
  def new
    @task = Task.new
  end

  # フォームから受け取った情報をもとに新しいタスクを作成。
  # @param [string] name タスク名
  # @param [text] detail タスクの詳細
  def create
    @task = Task.create(task_params)
    if @task.save
      flash[:success] = '正常に作成されました。'
      redirect_to @task
    else
      render :new
    end
  end

  # パラメータからidを取得しidに合致するタスクを取得。編集画面として表示。
  # @param [integer] id タスクのID
  def edit; end

  # フォームから受け取った情報をもとに既存のタスクを更新。
  # @param [string] name タスク名
  # @param [text] detail タスクの詳細
  def update
    if @task.update(task_params)
      flash[:success] = '正常に更新されました。'
      redirect_to @task
    else
      render :edit
    end
  end

  # パラメータからidを取得しidに合致するタスクを削除。
  # @param [integer] id タスクのID
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

  # パラメータからのidをもとに合致するタスクを @task に代入
  # @return [object] @task タスクインスタンス
  def set_task
    @task = Task.find(params[:id])
  end

  # ストロングパラメータによってタスクのnameとdetailのみを許可
  # @return [hash] {name: params[:name], detail: params[:detail]} フォームから入力されるデータ
  def task_params
    params.require(:task).permit(:name, :detail)
  end
end
