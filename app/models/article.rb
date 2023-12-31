# frozen_string_literal: true

class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user # Campo adicional
  has_many :has_categories, dependent: :destroy
  has_many :categories, through: :has_categories
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :category_elements, presence: true

  attr_accessor :category_elements

  def save_categories
    return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

    has_categories.where.not(category_id: category_elements).destroy_all

    category_elements.each do |category_id|
      HasCategory.find_or_create_by(article: self, category_id: category_id) if valid?
    end
  end
end
