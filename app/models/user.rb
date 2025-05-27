class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    admin: 0,
    attendant: 1,
    client: 2
  }

  validate :validate_cpf

  private

    def validate_cpf
      unless CPF.valid?(cpf)
        error.add(:cpf, 'invalid CPF')
      end
    end
end
