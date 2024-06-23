# frozen_string_literal: true

module UserRelationships
  extend ActiveSupport::Concern

  included do
    has_many :budgets, dependent: :destroy
  end
end
