class PostSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :user

  attributes :title, :description
end
