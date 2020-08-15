class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_host

  class Forbidden < ActionController::ActionControllerError; end

  # 投稿が見つからなかった場合のエラーを返す
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # 権限がなかった場合のエラーを返す
  rescue_from Forbidden, with: :forbidden

  private

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end

  def record_not_found
    render json: {
      message: 'Record Not Found'
    }, status: :not_found
  end

  def forbidden
    render json: {
      message: 'Forbidden'
    }, status: :forbidden
  end

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end
