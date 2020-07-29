module V1
  class MeController < ApplicationController
    # ログイン時のみアクセスを許可
    before_action :authenticate_v1_user!

    def posts
      page = params[:page] || 1

      posts = current_v1_user.posts
                             .page(page).per(10)

      render json: posts,
             each_serializer: V1::UserPostSerializer,
             meta: pagination_dict(posts),
             status: :ok
    end
  end
end
