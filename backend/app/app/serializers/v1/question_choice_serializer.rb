module V1
  class QuestionChoiceSerializer < ActiveModel::Serializer
    attributes :id,
               :body,
               :status

    has_many :choices
  end
end
