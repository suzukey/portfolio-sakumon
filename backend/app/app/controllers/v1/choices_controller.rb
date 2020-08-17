module V1
  class ChoicesController < ApplicationController
    # すべてのアクションに投稿者のみアクセス可

    # ログイン時のみアクセスを許可
    before_action :authenticate_v1_user!

    # 対象の問題を見つける
    before_action :set_question
    # 対象の選択肢を見つける
    before_action :set_choice, only: [:show, :update, :destroy]

    # 権限(投稿者)があるかチェック
    before_action :check_authorization

    # 編集のための一覧
    def index
      choices = @question.choices

      render json: choices,
             each_serializer: V1::ChoiceSerializer,
             status: :ok
    end

    # 選択肢の作成
    # TODO 下書きステータスの追加
    def create
      choice = @question.choices.create(post_params)

      if choice.errors.blank?
        render json: {
          choice: { id: choice.id }
        }, status: :created
      else
        render json: {
          data: choice.errors
        }, status: :bad_request
      end
    end

    # 選択肢の詳細閲覧
    def show
      render json: @choice,
             serializer: V1::ChoiceSerializer,
             status: :ok
    end

    # 選択肢の編集
    def update
      if @choice.update(post_params)
        render status: :no_content
      else
        render json: {
          data: @choice.errors
        }, status: :bad_request
      end
    end

    # 選択肢の削除
    def destroy
      if @choice.destroy
        render status: :no_content
      else
        render json: {
          data: @choice.errors
        }, status: :bad_request
      end
    end

    private

    def set_question
      @question = Question.find_by!(id: params[:question_id])
    end

    def set_choice
      @choice = Choice.find_by!(id: params[:id])
    end

    def check_authorization
      # 投稿主とユーザーidが一致しなければエラー
      raise Forbidden if @question.post.user_id != current_v1_user.id
    end

    def post_params
      params.permit(:body)
    end
  end
end
