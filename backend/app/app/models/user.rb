# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :trackable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  before_create :randomize_id

  has_many :posts, dependent: :destroy

  validates :email,
            uniqueness: true
  validates :name,
            uniqueness: true,
            presence: true,
            length: { in: 3..14 }
  validates :introduction,
            length: { maximum: 150 }
end
