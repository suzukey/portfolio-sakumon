module V1
  class UsersController < ApplicationController
    def show
      user = User.find_by!(name: params[:name])

      render json: user,
             serializer: V1::UserSerializer,
             status: :ok
    end


    # ユーザーの投稿一覧を取得
    def posts
      username = params[:name]
      page = params[:page] || 1

      if v1_user_signed_in? && current_v1_user.name == username
        posts = current_v1_user.posts
      else
        posts = User.find_by!(name: username)
                    .posts
                    .status_public
      end

      posts = posts.order(created_at: :desc)
                   .page(page).per(10)

      render json: posts,
             each_serializer: V1::UserPostSerializer,
             meta: pagination_dict(posts),
             status: :ok
    end
  end
end
