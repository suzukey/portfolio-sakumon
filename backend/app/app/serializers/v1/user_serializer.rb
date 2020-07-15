module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :name,
               :nickname,
               :profile
  end
end
