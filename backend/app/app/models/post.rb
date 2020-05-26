require 'securerandom'

class Post < ApplicationRecord
  BASE64_SIZE = 8

  before_create :randomize_id

  enum status: { public: 0, private: 1, unlisted: 2 }

  belongs_to :user
  validates :public_id, uniqueness: true

  private

  def randomize_id
    loop do
      self.public_id = SecureRandom.urlsafe_base64(BASE64_SIZE)

      # 同じidのレコードが存在しなければ場合はループをぬける
      break if Post.find_by(public_id: public_id).blank?
    end
  end
end
