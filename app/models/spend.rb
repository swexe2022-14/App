class Spend < ApplicationRecord
    validates :insititution, :spendmoney, :tag, presence: true
    validates :spendmoney, numericality: { only_integer: true }
end
