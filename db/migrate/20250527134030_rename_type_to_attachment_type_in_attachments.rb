class RenameTypeToAttachmentTypeInAttachments < ActiveRecord::Migration[7.1]
  def change
    rename_column :attachments, :type, :attachment_type
  end
end
