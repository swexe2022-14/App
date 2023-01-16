class User < ApplicationRecord
    validates :uid, :code, :pass, presence: true
    validates :code, numericality: { only_integer: true }
end
