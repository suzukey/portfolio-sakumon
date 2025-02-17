module V1
  class PostsController < ApplicationController
    # ログイン時のみ投稿、変更、削除を許可
    before_action :authenticate_v1_user!, only: [:create, :update, :destroy, :images]
    # 対象の投稿を見つける
    before_action :set_post, only: [:show, :update, :destroy, :images]
    # 編集・削除する権限があるかチェック
    before_action :check_authorization, only: [:update, :destroy, :images]

    # 投稿を作成
    def create
      post = Post.new(post_params)
      post.user_id = current_v1_user.id
      if post.save
        render json: {
          post: { id: post.id }
        }, status: :created
      else
        render json: {
          data: post.errors
        }, status: :bad_request
      end
    end

    # publicとunlistedは直リンクから誰でも見れる
    # privateは本人しか見れない
    def show
      # privateに投稿者ではないアクセスの場合、エラーを返す
      @post.status_private? && check_authorization

      render json: @post,
             serializer: V1::PostDetailSerializer,
             status: :ok
    end

    # 投稿を更新する
    def update
      if @post.update(post_params)
        render status: :no_content
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    # 投稿を削除する
    def destroy
      if @post.destroy
        render status: :no_content
      else
        render json: {
          data: @post.errors
        }, status: :bad_request
      end
    end

    # 使用する画像を投稿する
    def images
      image = params[:image]
      if @post.update(images: image)
        url_helpers = Rails.application.routes.url_helpers
        variant = @post.images.last.variant({})
        render json: {
          image: {
            url: url_helpers.rails_representation_url(variant),
            filename: image.original_filename
          }
        }, status: :ok
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end

    # --リスト系--------------------------

    # 最新投稿をピックアップ (publicのみ)
    def latest
      posts = Post.status_public
                  .order(created_at: :desc)
                  .limit(10)

      render json: posts,
             each_serializer: V1::PostSerializer,
             status: :ok
    end

    # TODO: LIKEの数等でピックアップ
    # トレンド投稿をピックアップ (publicのみ)
    def trend
      scope = params[:scope] || 'day'
      diff = scope_diff(scope)

      posts = Post.status_public
      if diff
        to = Time.current
        from = to - diff
        posts = posts.where(created_at: from...to)
      end
      posts = posts.order(created_at: :desc).limit(10)

      render json: posts,
             each_serializer: V1::PostSerializer,
             status: :ok
    end

    # 投稿を検索 (publicのみ)
    def search
      query = params[:q]
      # sort = params[:sort]
      page = params[:page] || 1

      posts = search_post(query)
      posts = posts.order(created_at: :desc)
                   .page(page).per(10)

      render json: posts,
             each_serializer: V1::PostDetailSerializer,
             meta: pagination_dict(posts),
             status: :ok
    end

    private

    def set_post
      @post = Post.find_by!(id: params[:id])
    end

    def check_authorization
      # 投稿主とログインしていないか、ユーザーidが一致しなければエラー
      raise Forbidden if !v1_user_signed_in? || @post.user_id != current_v1_user.id
    end

    def post_params
      params.permit(:title, :body, :status)
    end

    def scope_diff(scope)
      scopes = {
        day: 1.day,
        week: 1.week,
        month: 1.month,
        year: 1.year,
        all: false
      }
      scopes.key?(scope) ? scopes[scope] : false
    end

    def search_post(query)
      # queryが空でなかったら検索を行う
      if query.present?
        keywords = query.split(/[[:space:]]/)

        # 全ての検索ワードがタイトルか本文に含まれるかの検索クエリを作成
        grouping_hash = {}
        keywords.each_with_index do |word, idx|
          grouping_hash.update({ "#{idx}": { title_or_body_cont: word } })
        end

        q = {
          conbinator: 'and',
          groupings: grouping_hash
        }

        Post.status_public
            .ransack(q)
            .result
      else
        Post.none
      end
    end
  end
end
