module V1
  class PostSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :created_at

    belongs_to :user
    class UserSerializer < ActiveModel::Serializer
      attributes :name,
                 :nickname
    end
  end
end
