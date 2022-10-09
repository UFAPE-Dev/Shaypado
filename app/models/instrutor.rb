class Instrutor < ApplicationRecord
  belongs_to :academium
  has_one :endereco, dependent: :destroy

  validates :nome, presence: true, length: { maximum: 100, minimum: 10 }, format: { with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/, message: "Somente letras"}
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  validates :data_nascimento, presence: true, comparison: {less_than: Time.zone.today, greater_than: Date.new(1850, 1, 1)}
  validates :contato, presence: true, length: { is: 11 }, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  validates :horario_trabalho, presence: true
  validates :academium_id, presence: true
  validates :email , presence: true, length: { maximum: 100, minimum: 5 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "E-mail inválido"}
  validates :password , presence: true, length: { maximum: 20, minimum: 6 }
end
