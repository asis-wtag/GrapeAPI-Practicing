class Base < Grape::API
  mount V1::Resources::Tasks
  mount V1::Resources::Users
end