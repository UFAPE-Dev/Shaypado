class Exercicio < ApplicationRecord
  belongs_to :academium
  validates :titulo, presence: true, length: { minimum: 5 },format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :dificuldade, presence: true
  validates :calorias, presence: true, numericality: { only_integer: true }, length: { minimum: 1 }
  validates :descricao, presence: true, length: { minimum: 10}, length: { maximum: 500 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :quantidade, presence: true, numericality: { only_integer: true }, length: { minimum: 1 }
  validates :tipo, presence: true, length: { minimum: 5 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :academium_id, presence: true
  
end
