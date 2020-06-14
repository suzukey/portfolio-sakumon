class Question < ApplicationRecord
  before_create :randomize_id

  enum status: { publish: 0, draft: 1 }, _prefix: true

  belongs_to :post, touch: true
end
