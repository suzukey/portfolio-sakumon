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
  end
end
