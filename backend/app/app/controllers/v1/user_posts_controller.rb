module V1
  class UserPostsController < ApplicationController
    # ユーザーの投稿一覧を取得
    def index
      if v1_user_signed_in? && current_v1_user.name == params[:user_name]
        posts = current_v1_user.posts
      else
        posts = User.find_by!(name: params[:user_name])
                    .posts
                    .status_public
      end

      serializable_resource = ActiveModelSerializers::SerializableResource.new(
        posts,
        includes: '**',
        each_serializer: V1::PostSerializer
      )

      json_string = serializable_resource.as_json

      render json: json_string, status: :ok
    end
  end
end
