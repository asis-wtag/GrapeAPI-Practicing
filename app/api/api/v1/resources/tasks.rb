module V1
  module Resources
    class Tasks < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :tasks do
        desc 'Get All Tasks'
        get do
          tasks = Task.all
          present tasks, with: V1::Entities::Task
        end

        desc 'Create a Task'
        params do
          requires :title, type: String, desc: 'Task title'
          requires :completed, type: String, desc: 'Task completion status'
          requires :user_id, type: Integer, desc: 'User ID'
        end
        post do
          task = Task.create!(title: params[:title], completed: params[:completed], user_id: params[:user_id])
          present task, with: V1::Entities::Task
        end

        desc 'Get a Task'
        route_param :id do
          get do
            task = Task.find(params[:id])
            present task, with: V1::Entities::Task
          end
        end

        desc 'Update a Task'
        params do
          requires :title, type: String, desc: 'Task title'
          requires :completed, type: String, desc: 'Task completion status'
          requires :user_id, type: Integer, desc: 'User ID'
        end
        put ':id' do
          task = Task.find(params[:id])
          task.update!(title: params[:title], completed: params[:completed], user_id: params[:user_id])
          present task, with: V1::Entities::Task
        end

        desc 'Delete a Task'
        delete ':id' do
          task = Task.find(params[:id])
          task.destroy
          status :no_content
        end
      end
    end
  end
end
