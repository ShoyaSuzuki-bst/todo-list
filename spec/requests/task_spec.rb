require 'rails_helper'

RSpec.describe "Tasks controller", type: :request do
  before { @task = FactoryBot.create(:task) }

  describe "GET /index" do
    context'http response check' do
      it 'return status 200' do
        get tasks_path 
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /show" do
    context 'http response check' do
      it 'return status 200' do
        get task_path(@task.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /new" do
    context 'http response check' do
      it 'return status 200' do
        get new_task_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /create" do
    before { ActionController::Base.allow_forgery_protection = false }
    after  { ActionController::Base.allow_forgery_protection = true }
    context 'http response check' do
      it 'return status 302(redirect to :show)' do
        post '/tasks/', params: {task: attributes_for(:task)}
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET /edit" do
    context 'http response check' do
      it 'return status 200' do
        get edit_task_path(@task.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PATCH /update" do
    before { ActionController::Base.allow_forgery_protection = false }
    after  { ActionController::Base.allow_forgery_protection = true }
    context 'http response check' do
      it 'return status 200(redirect to :show)' do
        patch "/tasks/#{@task.id}", params: {task: attributes_for(:task)}
        expect(response).to have_http_status(302)
      end
    end
  end
end
