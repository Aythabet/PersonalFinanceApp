class Transaction < ApplicationRecord
  belongs_to :ledger
  validates :title, presence: true
  validates :value, presence: true, numericality: { only_float: true }
end
