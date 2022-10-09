class Endereco < ApplicationRecord

  # Relacionamentos
  belongs_to :instrutor

  # Validacoes
  validates :logradouro, precense: true, length: { in: 4..100 }
  validates :numero, precense: true, length: { in: 1..10 }
  validates :complemento, length: { in: 2..100 }
  validates :cep, precense: true, with => /\A\d{5}-\d{3}\z/, message: "CEP inválido"
  validates :bairro, precense: true, length: { in: 2..100 }
  validates :cidade, precense: true, length: { in: 2..100 }

end
