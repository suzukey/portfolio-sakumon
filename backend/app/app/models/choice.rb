class Choice < ApplicationRecord
  before_create :randomize_id

  belongs_to :question, touch: true
end
