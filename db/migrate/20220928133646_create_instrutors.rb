class CreateInstrutors < ActiveRecord::Migration[7.0]
  def change
    create_table :instrutors do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.string :contato
      t.references :academium, null: false, foreign_key: true
      t.time :horario_trabalho
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
