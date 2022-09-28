class Proprietario < ApplicationRecord
  has_many :academiums
  has_one :user, as: :userable
end
