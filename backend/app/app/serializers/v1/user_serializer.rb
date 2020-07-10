module V1
  class UserSerializer
    include FastJsonapi::ObjectSerializer

    attributes :name, :nickname, :profile
  end
end
