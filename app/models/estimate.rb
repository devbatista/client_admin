class Estimate < ApplicationRecord
  belongs_to :client

  has_many :attachments, as: :attachable, dependent: :destroy

  enum status: {
    pending: 0,
    approved: 1,
    refused: 2
  }

  validates :description, :value, :status, :due_date, :presence_true, length: { minimum: 5, maximum: 255 }
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :due_date, presence: true
  
  validate :due_date_cannot_be_in_the_past

  private

    def due_date_cannot_be_in_the_past
      if due_date.present? && due_date < Date.today
        errors.add(:due_date, "cannot be in the past")
      end
    end
end
