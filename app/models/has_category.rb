# frozen_string_literal: true

class HasCategory < ApplicationRecord
  belongs_to :article # Tiene UN artículo
  belongs_to :category # Tiene UNA categoría
end
