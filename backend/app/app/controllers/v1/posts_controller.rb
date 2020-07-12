module V1
  class PostsController < ApplicationController
    # ログイン時のみ投稿、変更、削除を許可
    before_action :authenticate_v1_user!, only: [:create, :update, :destroy]
    # 対象の投稿を見つける
    before_action :set_post, only: [:show, :update, :destroy]
    # 編集・削除する権限があるかチェック
    before_action :check_authorization, only: [:update, :destroy]

    # 投稿を作成
    def create
      post = Post.new(post_params)
      post.user_id = current_v1_user.id
      if post.save
        render status: :created
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

      render json: @post,
             serializer: V1::PostDetailSerializer,
             status: :ok
    end

    # 投稿を更新する
    def update
      if @post.update(post_params)
        render status: :no_content
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    # 投稿を削除する
    def destroy
      if @post.destroy
        render status: :no_content
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    # --リスト系--------------------------

    # 最新投稿をピックアップ (publicのみ)
    def latest
      posts = Post.status_public
                  .order(created_at: :desc)
                  .limit(10)

      render json: posts,
             each_serializer: V1::PostSerializer,
             status: :ok
    end

    # トレンド投稿をピックアップ (publicのみ)
    def trend
      # scope = params[:scope]

      posts = Post.status_public
                  .order(created_at: :desc)
                  .limit(10)

      render json: posts,
             each_serializer: V1::PostSerializer,
             status: :ok
    end

    # 投稿を検索 (publicのみ)
    def search
      # query = params[:query]
      # sort = params[:sort]
      page = params[:page] || 1

      posts = Post.status_public
                  .order(created_at: :desc)
                  .page(page).per(10)

      render json: posts,
             each_serializer: V1::PostSerializer,
             meta: pagination_dict(posts),
             status: :ok
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
  end
end
