require 'securerandom'

class Post < ApplicationRecord
  before_create :randomize_id

  enum status: { public: 0, private: 1, unlisted: 2 }, _prefix: true

  belongs_to :user

  validates :status,
            presence: true,
            inclusion: { in: 0..2 }
end
