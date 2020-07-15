class Choice < ApplicationRecord
  belongs_to :question, touch: true
end
