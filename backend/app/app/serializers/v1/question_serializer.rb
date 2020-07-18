module V1
  class QuestionSerializer < ActiveModel::Serializer
    attributes :id,
               :body,
               :status

    belongs_to :post
  end
end
