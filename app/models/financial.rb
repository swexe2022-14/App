class Financial < ApplicationRecord
    validates :insititution, :usable, presence: true
    validates :insititution, uniqueness: true
    validates :usable, numericality: { only_integer: true }
end
