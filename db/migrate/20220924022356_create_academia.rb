class CreateAcademia < ActiveRecord::Migration[7.0]
  def change
    create_table :academia do |t|
      t.string :id_proprietario, references: :user, foreign_key: true
      t.string :integer
      t.string :nome
      t.string :email
      t.string :endereco
      t.string :cpf
      t.string :contato
      t.boolean :ativo

      t.timestamps
    end
  end
end
