module V1
  class UserPostSerializer < ActiveModel::Serializer
    attributes :title,
               :status,
               :created_at
  end
end
