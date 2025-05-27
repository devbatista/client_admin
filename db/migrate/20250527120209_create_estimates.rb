class CreateEstimates < ActiveRecord::Migration[7.1]
  def change
    create_table :estimates, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.string :description
      t.decimal :value
      t.integer :status, null: false, default: 0
      t.date :due_date

      t.timestamps
    end
  end
end
