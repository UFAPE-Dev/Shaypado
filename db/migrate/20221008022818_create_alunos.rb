class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.string :contato
      t.string :senha
      t.references :academium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
