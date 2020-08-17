module V1
  class ChoiceSerializer < ActiveModel::Serializer
    attributes :id,
               :body,
               :correct
  end
end
