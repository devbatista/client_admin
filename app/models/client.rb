class Client < ApplicationRecord
  belongs_to :user

  has_many :attachments, as: :attachable, dependent: :destroy

  validates :name, presence: true
  validates :cpf_cnpj, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A\(?\d{2}\)?\s?\d{4,5}-?\d{4}\z/ }
  validates :address, presence: true

  validate :validate_cpf_cnpj

  private

    def validate_cpf_cnpj
      unless CPF.valid?(cpf_cnpj) || CNPJ.valid?(cpf_cnpj)
        errors.add(:cpf_cnpj, 'invalid')
      end
    end
end
