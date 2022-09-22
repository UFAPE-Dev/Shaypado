class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:proprietario, :instrutor, :aluno]
  after_initialize :set_default_role, :if => :new_record?
  validates :nome, presence: true
  def set_default_role
    self.role ||= :proprietario
  end
end
