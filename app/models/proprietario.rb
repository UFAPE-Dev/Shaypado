class Proprietario < ApplicationRecord
  has_one :user, as: :userable
end
