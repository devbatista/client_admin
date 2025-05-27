class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments, id: :uuid do |t|
      t.references :attachable, polymorphic: true, null: false, type: :uuid
      t.string :type, null: false
      t.string :file
      t.uuid :uploaded_by

      t.timestamps
    end
  end
end
