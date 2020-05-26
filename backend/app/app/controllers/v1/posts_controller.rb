module V1
  class PostsController < ApplicationController
    # ログイン時のみ投稿、変更、削除を許可
    before_action :authenticate_v1_user!, only: [:create, :update, :destroy]
    # 対象の投稿を見つける
    before_action :set_post, only: [:show, :update, :destroy]
    # 編集・削除する権限があるかチェック
    before_action :check_authorization, only: [:update, :destroy]

    def index
      posts = Post.order(created_at: :desc)
      render json: {
        data: posts
      }, status: :ok
    end

    def create
      post = Post.new(post_params)
      post.user_id = current_v1_user.id
      if post.save
        render json: {
          data: post
        }, status: :created
      else
        render json: {
          data: post.errors
        }, status: :bad_request
      end
    end

    def show
      render json: {
        data: @post
      }, status: :ok
    end

    def update
      if @post.update(post_params)
        render json: {
          data: @post
        }, status: :ok
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    def destroy
      @post.destroy
      render json: {
        data: @post
      }, status: :ok
    end

    private

    def set_post
      @post = Post.find_by!(id: params[:id])
    end

    def check_authorization
      # 投稿主とログインユーザーが一致する場合のみ変更を許可
      raise Forbidden if @post.user_id != current_v1_user.id
    end

    def post_params
      params.permit(:title, :description)
    end
  end
end
