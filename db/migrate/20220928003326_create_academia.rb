class CreateAcademia < ActiveRecord::Migration[7.0]
  def change
    create_table :academia do |t|
      t.string :nome
      t.string :email
      t.string :cnpj
      t.string :contato
      t.boolean :ativo
      t.references :proprietario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
