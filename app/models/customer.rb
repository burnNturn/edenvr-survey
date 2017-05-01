class Customer < ApplicationRecord

  validates  :game, :age, :gender, :race, :income,
    :group_type, :group_size, presence: true
    
  def self.search(keyword)
    keyword.present? ? Customer.where(game: keyword) : Customer.all
  end
end
