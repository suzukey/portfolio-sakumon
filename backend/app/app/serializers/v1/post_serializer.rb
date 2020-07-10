module V1
  class PostSerializer
    include FastJsonapi::ObjectSerializer

    belongs_to :user

    attributes :title, :description, :created_at, :updated_at
  end
end
