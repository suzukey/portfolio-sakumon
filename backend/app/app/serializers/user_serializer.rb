class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :nickname, :profile
end
