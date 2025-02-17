module V1
  class PlayController < ApplicationController
    before_action :set_post

    def start
      render json: @post,
             include: '**',
             serializer: V1::PostPlaySerializer,
             status: :ok
    end

    def check
      question_id = params[:question_id]
      answer = params[:answer]

      question = @post.questions.find_by!(id: question_id)
      correct_choices = question.choices.where(correct: true)

      result = check_answer(answer, correct_choices)

      render json: {
        result: result ? 'correct' : 'incorrect',
        correct_choices: correct_choices.pluck(:body)
      }, status: :ok
    end

    private

    def set_post
      @post = Post.find_by!(id: params[:post_id])
      @post.status_private? && check_authorization
    end

    def check_authorization
      # 投稿主とログインしていないか、ユーザーidが一致しなければエラー
      raise Forbidden if !v1_user_signed_in? || @post.user_id != current_v1_user.id
    end

    # 正解ならtrueを返却
    def check_answer(answer, correct_choices)
      # 回答が配列かどうか
      !answer.instance_of?(Array) && return

      correct_ids = correct_choices.pluck(:id)

      # 回答の数と正解の数が同一か
      answer.length != correct_ids.length && return

      check_array = answer & correct_ids
      check_array.length != correct_ids.length && return

      true
    end
  end
end
