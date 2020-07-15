module V1
  class UserPostSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :status,
               :created_at
  end
end
