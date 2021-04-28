# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }
  validates :detail, length: { maximum: 660 }

  has_one :status
end
