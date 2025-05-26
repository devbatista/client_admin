class Client < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cpd_cnpj, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A\(?\d{2}\)?\s?\d{4,5}-?\d{4}\z/ }
  validates :address, presence: true
end
