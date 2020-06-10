module V1
  class PostsController < ApplicationController
    # ログイン時のみ投稿、変更、削除を許可
    before_action :authenticate_v1_user!, only: [:create, :update, :destroy]
    # 対象の投稿を見つける
    before_action :set_post, only: [:show, :update, :destroy]
    # 編集・削除する権限があるかチェック
    before_action :check_authorization, only: [:update, :destroy]

    # publicしか全体で表示しない
    def index
      posts = Post.status_public.order(created_at: :desc)
      json_string = serialize_to_json(posts)
      render json: json_string, status: :ok
    end

    def create
      post = Post.new(post_params)
      post.user_id = current_v1_user.id
      if post.save
        json_string = serialize_to_json(post)
        render json: json_string, status: :created
      else
        render json: {
          data: post.errors
        }, status: :bad_request
      end
    end

    # publicとunlistedは直リンクから誰でも見れる
    # privateは本人しか見れない
    def show
      # privateに投稿者ではないアクセスの場合、エラーを返す
      @post.status_private? && check_authorization

      json_string = serialize_to_json(@post)
      render json: json_string, status: :ok
    end

    def update
      if @post.update(post_params)
        json_string = serialize_to_json(@post)
        render json: json_string, status: :ok
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    def destroy
      if @post.destroy
        json_string = serialize_to_json(@post)
        render json: json_string, status: :ok
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    private

    def set_post
      @post = Post.find_by!(id: params[:id])
    end

    def check_authorization
      # 投稿主とログインしていないか、ユーザーidが一致しなければエラー
      raise Forbidden if !v1_user_signed_in? || @post.user_id != current_v1_user.id
    end

    def post_params
      params.permit(:title, :description, :status)
    end

    def serialize_to_json(posts)
      options = {
        include: %i[user],
        fields: {
          post: %i[title description created_at updated_at user],
          user: %i[name nickname]
        }
      }
      PostSerializer.new(posts, options).serialized_json
    end
  end
end
