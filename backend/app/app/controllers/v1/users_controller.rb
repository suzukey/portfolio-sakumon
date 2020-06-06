module V1
  class UsersController < ApplicationController
    # 対象の投稿を見つける
    before_action :set_user, only: [:show]

    # publicとunlistedは直リンクから誰でも見れる
    # privateは本人しか見れない
    def show
      # privateに投稿者ではないアクセスの場合、エラーを返す
      render json: {
        data: @user
      }, status: :ok
    end

    private

    def set_user
      @user = User.find_by!(name: params[:name])
    end
  end
end
