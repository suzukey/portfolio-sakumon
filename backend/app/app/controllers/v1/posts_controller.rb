module V1
  class PostsController < ApplicationController
    # ログイン時のみ投稿、変更、削除を許可
    before_action :authenticate_v1_user!, only: [:create, :update, :destroy]
    # 対象の投稿を見つける
    before_action :set_post, only: [:show, :update, :destroy]
    # 投稿が見つからなかった場合のエラーを返す
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
      posts = Post.order(created_at: :desc)
      render json: {
        data: posts
      }, status: :ok
    end

    def show
      render json: {
        data: @post
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

    def destroy
      @post.destroy
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

    private

    def set_post
      @post = Post.find_by!(id: params[:id])
    end

    def post_params
      params.permit(:title)
    end

    def record_not_found
      render json: {
        message: 'Record Not Found'
      }, status: :not_found
    end
  end
end
