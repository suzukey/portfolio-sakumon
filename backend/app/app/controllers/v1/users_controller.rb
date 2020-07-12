module V1
  class UsersController < ApplicationController
    # ユーザー情報を取得
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

      posts = get_user_posts(username)

      posts = posts.order(created_at: :desc)
                   .page(page).per(10)

      render json: posts,
             each_serializer: V1::UserPostSerializer,
             meta: pagination_dict(posts),
             status: :ok
    end
  end

  private

  # 取得先ユーザー名とユーザーが一致していたら非公開など含め全て取得
  def get_user_posts(username)
    if v1_user_signed_in? && current_v1_user.name == username
      current_v1_user.posts
    else
      User.find_by!(name: username)
          .posts
          .status_public
    end
  end
end
