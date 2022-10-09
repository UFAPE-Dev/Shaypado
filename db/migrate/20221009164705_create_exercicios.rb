class CreateExercicios < ActiveRecord::Migration[7.0]
  def change
    create_table :exercicios do |t|
      t.string :titulo
      t.string :dificuldade
      t.string :calorias
      t.text :descricao
      t.integer :quantidade
      t.string :tipo
      t.references :academium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
