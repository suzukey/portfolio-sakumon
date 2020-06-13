class Question < ApplicationRecord
  before_create :randomize_id

  belongs_to :post, touch: true
end
