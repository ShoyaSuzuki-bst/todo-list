require 'rails_helper'

RSpec.describe "Tasks controller", type: :request do
  let(:task) { FactoryBot.create(:task) }

  shared_context 'allow_csrf' do
    before { ActionController::Base.allow_forgery_protection = false }
    after  { ActionController::Base.allow_forgery_protection = true }
  end

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
        get task_path(task.id)
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
    include_context 'allow_csrf'
    context 'when input valid params' do
      it 'return status 302(redirect to :show)' do
        post tasks_path, params: {task: attributes_for(:task)}
        expect(response).to have_http_status(302)
      end
    end

    context 'when input invalid params' do
      it 'return status 200(with validation error)' do
        post tasks_path params: { task: attributes_for(:task, :blank_name) }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /edit" do
    context 'http response check' do
      it 'return status 200' do
        get edit_task_path(task.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PATCH /update" do
    include_context 'allow_csrf'
    context 'http response check' do
      it 'return status 200(redirect to :show)' do
        patch task_path(task.id), params: {task: attributes_for(:task)}
        expect(response).to have_http_status(302)
      end
    end

    context 'when input invalid params' do
      it 'return status 200(with validation error)' do
        patch task_path(task.id), params: { task: attributes_for(:task, :blank_name) }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "DELETE /destroy" do
    include_context 'allow_csrf'
    context 'http response check' do
      it 'return status 302(redirect to :index)' do
        delete task_path(task.id)
        expect(response).to have_http_status(302)
      end
    end
  end
end
