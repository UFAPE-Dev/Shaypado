class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:proprietario, :instrutor, :aluno]
  after_initialize :set_default_role, :if => :new_record?
  validates :nome, presence: true, length: { maximum: 100, minimum: 10 }, format: { with: /\A[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/, message: "Somente letras"}
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  validates :data_nascimento, presence: true, comparison: {less_than: Time.zone.today, greater_than: Date.new(1850, 1, 1)}
  validates :cep, presence: true, length: { maximum: 8 }, format: { with: /\A\d{8}\z/ }
  validates :endereco, presence: true, length: { maximum: 100, minimum: 5 }
  validates :contato, presence: true, length: { is: 11 }, format: { with: /\A[0-9]+\z/, message: "Somente números" }
  validates :horario_trabalho, presence: true

  def set_default_role
    self.role ||= :proprietario
  end
end
