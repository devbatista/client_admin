class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  belongs_to :uploader, class_name: 'User', foreign_key: 'uploaded_by'

  has_one_attached :file

  validates :file, presence: true
  validates :type, presence: true
end
