class CreateProprietarios < ActiveRecord::Migration[7.0]
  def change
    create_table :proprietarios do |t|

      t.timestamps
    end
  end
end
