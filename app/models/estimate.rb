class Estimate < ApplicationRecord
  belongs_to :client

  enum status: {
    pending: 0,
    approved: 1,
    refused: 2
  }

  validates :description, :value, :status, :due_date, :presence_true
end
