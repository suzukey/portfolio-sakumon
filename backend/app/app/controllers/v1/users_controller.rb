module V1
  class UsersController < ApplicationController
    def show
      user = User.find_by!(name: params[:name])
      options = {}
      json_string = V1::UserSerializer.new(user, options).serialized_json
      render json: json_string, status: :ok
    end
  end
end
