module V1
  class QuestionSerializer < ActiveModel::Serializer
    attributes :id,
               :body,
               :status
  end
end
