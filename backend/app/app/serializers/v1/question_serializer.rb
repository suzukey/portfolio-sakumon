module V1
  class QuestionSerializer < ActiveModel::Serializer
    attributes :statement,
               :status

    belongs_to :post
  end
end