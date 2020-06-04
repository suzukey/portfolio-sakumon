module V1
  class ProfilesController < ApplicationController
    def index
      profiles = User.order(created_at: :desc)
      render json: {
        data: profiles
      }, status: :ok
    end
  end
end
