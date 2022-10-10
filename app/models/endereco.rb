class Endereco < ApplicationRecord

  # Relacionamentos
  belongs_to :instrutor

  # Validacoes
  validates :logradouro, presence: true, length: { in: 4..100 }
  validates :numero, presence: true, length: { in: 1..10 }
  validates :complemento, length: { in: 2..100 }
  validates :cep, presence: true, length: { is: 8 }, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  validates :bairro, presence: true, length: { in: 2..100 }
  validates :cidade, presence: true, length: { in: 2..100 }

end
