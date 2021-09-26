class Transaction < ApplicationRecord
  belongs_to :account

  validates :title, presence: true
  #validates :account, presence: true
  validates :value, presence: true, numericality: { only_float: true }
end
