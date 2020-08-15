require 'securerandom'

class Post < ApplicationRecord
  before_create :randomize_id

  enum status: { public: 0, private: 1, unlisted: 2 }, _prefix: true

  has_many :questions, dependent: :destroy
  belongs_to :user

  has_many_attached :images

  validates :title,
            presence: true,
            length: { maximum: 48 }
  validates :body,
            length: { maximum: 150 }
  validates :status,
            presence: true
end
