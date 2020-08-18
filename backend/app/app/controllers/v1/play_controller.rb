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
      render json: {}, status: :ok
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
  end
end
