module V1
  class QuestionsController < ApplicationController
    # すべてのアクションに投稿者のみアクセス可

    # ログイン時のみアクセスを許可
    before_action :authenticate_v1_user!

    # 対象の投稿を見つける
    before_action :set_post
    # 対象の問題を見つける
    before_action :set_question, only: [:show, :update, :destroy]

    # 権限(投稿者)があるかチェック
    before_action :check_authorization

    # 編集のための一覧
    def index
      questions = @post.questions

      render json: questions,
             each_serializer: V1::QuestionSerializer,
             status: :ok
    end

    # 問題の作成
    def create
      question = @post.questions.create(post_params)

      if question.errors.blank?
        render status: :created
      else
        render json: {
          data: question.errors
        }, status: :bad_request
      end
    end

    # 問題の詳細閲覧
    def show
      render json: @question,
             serializer: V1::QuestionChoiceSerializer,
             status: :ok
    end

    # 問題の編集
    def update
      if @question.update(post_params)
        render status: :no_content
      else
        render json: {
          data: @question.errors
        }, status: :bad_request
      end
    end

    # 問題の削除
    def destroy
      if @question.destroy
        render status: :no_content
      else
        render json: {
          data: @question.errors
        }, status: :bad_request
      end
    end

    private

    def set_post
      @post = Post.find_by!(id: params[:post_id])
    end

    def set_question
      @question = Question.find_by!(id: params[:id])
    end

    def check_authorization
      # 投稿主とユーザーidが一致しなければエラー
      raise Forbidden if @post.user_id != current_v1_user.id
    end

    def post_params
      params.permit(:body)
    end
  end
end
