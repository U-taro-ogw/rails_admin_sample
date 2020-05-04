class Administrator < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, confirmation: true
end
