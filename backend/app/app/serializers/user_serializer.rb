class UserSerializer
  include FastJsonapi::ObjectSerializer

  has_many :posts

  attributes :name, :nickname, :profile
end
