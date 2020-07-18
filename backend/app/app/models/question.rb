class Question < ApplicationRecord
  before_create :randomize_id

  enum status: { publish: 0, draft: 1 }, _prefix: true

  has_many :choices, dependent: :destroy
  belongs_to :post, touch: true

  validates :body,
            presence: true
  validates :status,
            presence: true
end
