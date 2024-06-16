# frozen_string_literal: true

module UserValidations
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    validates :password, length: { minimum: 8 }, format: {
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).*\z/,
      message: 'must include at least one lowercase letter, one uppercase letter, one digit, and one special character'
    }
  end
end
