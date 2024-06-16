# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include UserValidations
  include UserRelationships
  include UserScopes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end