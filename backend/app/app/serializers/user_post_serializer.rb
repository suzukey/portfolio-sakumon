class UserPostSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :description, :status, :created_at, :updated_at
end
