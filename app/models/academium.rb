class Academium < ApplicationRecord
  validates :nome, presence: true, length: { maximum: 100, minimum: 10 }, format: { with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/, message: "Somente letras"}
  validates :endereco, presence: true, length: { maximum: 100, minimum: 5 }
  validates :contato, presence: true, length: { is: 11 }, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  validates :email, presence: true, length: {minimum: 5}, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :cnpj, presence: true, length: {is: 14}, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  belongs_to :proprietario
  has_many :alunos
  has_many :exercicios
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
end
