class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name
      t.string :cpf_cnpj
      t.string :phone
      t.string :address
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
