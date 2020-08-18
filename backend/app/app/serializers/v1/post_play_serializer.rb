module V1
  class PostPlaySerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :questions

    # 公開ステータスの問題を順番シャッフルして取ってくる
    def questions
      object.questions.status_publish.shuffle.map do |question|
        QuestionSerializer.new(question, scope: scope, root: false, event: object)
      end
    end

    class QuestionSerializer < ActiveModel::Serializer
      attributes :id,
                 :body,
                 :type,
                 :choices

      # 複数選択か一つ選択か
      def type
        correct_count = object.choices.where(correct: true).count
        correct_count > 1 ? 'multiple' : 'single'
      end

      # 選択肢を順番シャッフルしてとってくる
      def choices
        object.choices.shuffle.map do |choice|
          ChoiceSerializer.new(choice, scope: scope, root: false, event: object)
        end
      end

      class ChoiceSerializer < ActiveModel::Serializer
        attributes :id,
                   :body
      end
    end
  end
end
