class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.integer :numero
      t.string :complemento
      t.string :cep
      t.string :bairro
      t.string :cidade


      t.timestamps
    end
  end
end
