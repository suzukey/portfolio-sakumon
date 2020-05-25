# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :posts, dependent: :destroy
end
