module V1
  class PostEditSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :body,
               :status

    has_many :questions
  end
end
