require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  before do
    @task = Task.create(
      name: 'test task',
      detail: 'これはテスト用のタスクです。'
    )
  end

  describe "GET /index" do
    it 'httpステータスが200となる' do
      get tasks_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it 'httpステータスが200となる' do
      get task_path(@task.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it 'httpステータスが200となる' do
      get new_task_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    before { ActionController::Base.allow_forgery_protection = false }
    after  { ActionController::Base.allow_forgery_protection = true }
    let(:params) do
      {
        task: {
          name: '新規作成テスト',
          detail: '新規作成できるかテスト'
        }
      }
    end
    it 'httpステータスが302となる' do
      post '/tasks/', params: params
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /edit" do
    it 'httpステータスが200となる' do
      get edit_task_path(@task.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /update" do
    before { ActionController::Base.allow_forgery_protection = false }
    after  { ActionController::Base.allow_forgery_protection = true }
    let(:params) do
      {
        id: "#{@task.id}",
        task:{
          name: 'test task',
          detail: '編集ができるのかテスト'
        }
      }
    end
    it 'httpステータスが302となる(showへリダイレクトされる)' do
      patch "/tasks/#{@task.id}", params: params
      expect(response).to have_http_status(302)
    end
  end
end
