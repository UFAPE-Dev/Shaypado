class Endereco < ApplicationRecord

  # Relacionamentos
  has_many :alunos
  has_many :instrutors

  # Validacoes
  validates :logradouro, presence: true, length: { in: 4..100 }
  validates :cep, presence: true, length: { is: 8 }, format: { with: /\A[0-9]+\z/, message: "Somente números" }

end
