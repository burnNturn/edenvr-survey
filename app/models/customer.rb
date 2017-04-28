class Customer < ApplicationRecord

  validates :date, :machine, :game, :age, :gender, :race, :income,
    :group_type, :group_size, presence: true

end
