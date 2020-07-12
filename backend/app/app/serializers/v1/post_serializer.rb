module V1
  class PostSerializer < ActiveModel::Serializer
    attributes :title,
               :created_at

    belongs_to :user
    class UserSerializer < ActiveModel::Serializer
      attributes :name,
                 :nickname
    end
  end


  class PostDetailsSerializer < ActiveModel::Serializer
    attributes :title,
               :description,
               :created_at,
               :updated_at

    belongs_to :user
    class UserSerializer < ActiveModel::Serializer
      attributes :name,
                 :nickname
    end
  end
end
