module V1
  class UserPostSerializer < ActiveModel::Serializer
    attributes :title,
               :description,
               :status,
               :created_at,
               :updated_at
  end
end
