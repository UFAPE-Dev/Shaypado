class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :cep

      t.references :instrutor, foreign_key: true, null: true
      t.references :aluno, foreign_key: true, null: true
      t.references :academia, foreign_key: true, null: true

      t.timestamps
    end
  end
end
