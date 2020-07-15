module V1
  class QuestionSerializer < ActiveModel::Serializer
    attributes :id,
               :statement,
               :status

    belongs_to :post
  end
end
