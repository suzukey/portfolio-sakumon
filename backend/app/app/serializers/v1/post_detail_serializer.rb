module V1
  class PostDetailSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :body,
               :created_at,
               :updated_at

    belongs_to :user
    class UserSerializer < ActiveModel::Serializer
      attributes :name,
                 :nickname
    end
  end
end
