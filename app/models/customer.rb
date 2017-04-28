class Customer < ApplicationRecord

  validates  :game, :age, :gender, :race, :income,
    :group_type, :group_size, presence: true
end
