module V1
  module Entities
    class Task < Grape::Entity
      expose :id
      expose :title
      expose :completed
      expose :user, using: V1::Entities::User
    end
  end
end