module V1
  class UserPostsController < ApplicationController
    def index
      if v1_user_signed_in? && current_v1_user.name == params[:user_name]
        posts = current_v1_user.posts
      else
        posts = User.find_by!(name: params[:user_name])
                    .posts
                    .status_public
      end

      options = {}
      json_string = UserPostSerializer.new(posts, options).serialized_json

      render json: json_string, status: :ok
    end
  end
end
