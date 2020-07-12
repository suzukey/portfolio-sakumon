module V1
  class UsersController < ApplicationController
    def show
      user = User.find_by!(name: params[:name])

      serializable_resource = ActiveModelSerializers::SerializableResource.new(
        user,
        includes: '**',
        each_serializer: V1::UserSerializer
      )

      json_string = serializable_resource.as_json

      render json: json_string, status: :ok
    end


    # ユーザーの投稿一覧を取得
    def posts
      username = params[:name]
      if v1_user_signed_in? && current_v1_user.name == username
        posts = current_v1_user.posts
      else
        posts = User.find_by!(name: username)
                    .posts
                    .status_public
      end

      serializable_resource = ActiveModelSerializers::SerializableResource.new(
        posts,
        includes: '**',
        each_serializer: V1::UserPostSerializer
      )

      json_string = serializable_resource.as_json

      render json: json_string, status: :ok
    end
  end
end
