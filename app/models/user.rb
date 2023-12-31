# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy # Siempre en plural
  has_many :comments

  has_one_attached :avatar
  validates :first_name, presence: true
  validates :last_name, presence: true
end
