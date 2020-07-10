module V1
  class QuestionSerializer
    include FastJsonapi::ObjectSerializer

    belongs_to :post

    attributes :statement, :status
  end
end