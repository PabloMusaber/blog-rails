class Category < ApplicationRecord
    has_many :has_categories, dependent: :destroy
    has_many :articles, through: :has_categories
end
