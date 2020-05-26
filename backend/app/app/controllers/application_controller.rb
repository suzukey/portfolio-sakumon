class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  class Forbidden < ActionController::ActionControllerError; end

  # 投稿が見つからなかった場合のエラーを返す
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # 権限がなかった場合のエラーを返す
  rescue_from Forbidden, with: :forbidden

  private

  def record_not_found
    render json: {
      message: 'Record Not Found'
    }, status: :not_found
  end

  def forbidden
    render json: {
      message: 'Unauthorized'
    }, status: :forbidden
  end
end
