require 'securerandom'

class Post < ApplicationRecord
  before_create :randomize_id

  enum status: { public: 0, private: 1, unlisted: 2 }, _prefix: true

  belongs_to :user

  validates :title,
            presence: true,
            length: { maximum: 48 }
  validates :description,
            length: { maximum: 150 }
  validates :status,
            presence: true
end
