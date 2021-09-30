class Transaction < ApplicationRecord
  validates :title, presence: true
  validates :account, presence: true
  validates :value, presence: true, numericality: { only_float: true }
end
