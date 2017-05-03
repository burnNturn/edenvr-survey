class Customer < ApplicationRecord
  enum game_name: {
    "Tilt Brush" => "Tilt Brush",
    "Brookhaven" => "Brookhaven",
    "The Blu"    => "The Blu"
  }

  enum age_range: {
    "5 to 9"   => "5 to 9",
    "10 to 12" => "10 to 12",
    "13 to 15" => "13 to 15",
    "16 to 18" => "18 to 25",
    "25 to 30" => "25 to 30",
    "30 to 40" => "30 to 40",
    "40 plus"  => "40 plus"
  }

  enum race_field: {
    "Hispanic or Latino"     => "Hispanic or Latino",
    "White"                  => "White",
    "Black/African American" => "Black/African American",
    "Asian"                  => "Asian",
    "Native American"        => "Native American",
    "Middle Eastern"         => "Middle Eastern",
    "Pacific Islander"       => "Pacific Islander",
    "Multiracial"            => "Multiracial"
  }

  enum gender_field: {
    "Male"   => "Male",
    "Female" => "Female"
  }

  enum income_field: {
    "Less than $20,000"  => "Less than $20,000",
    "$20,000 to $34,999" => "$20,000 to $34,999",
    "$35,000 to $49,999" => "$35,000 to $49,999",
    "$50,000 to $74,999" => "$50,000 to $74,999",
    "$74,999 to $99,999" => "$74,999 to $99,999",
    "$100,000 plus"      => "$100,000 plus"
  }

  enum group_type: {
    "Individual"             => "Individual",
    "Couple-Date"            => "Couple-Date",
    "Group-Friends"          => "Group-Friends",
    "Group-Family"           => "Group-Family",
    "Group-Immediate Family" => "Group-Immediate Family"
  }

  validates  :game, :age, :gender, :race, :income,
    :group_type, :group_size, presence: true
    
  def self.search(paramz)
    #keyword.present? ? Customer.where(game: keyword) : Customer.all
    age = paramz[:age]
    gender = paramz[:gender]
    income = paramz[:income]
    race = paramz[:race]
    game = paramz[:game].present? ? paramz[:game] : "%%"
    customers = Customer.where('game LIKE ?', "%#{game}%").where("gender LIKE ?", "#{gender}").where("age LIKE ?", "#{age}").where("income LIKE ?", "#{income}").where("race LIKE ?", "#{race}")
    return Customer.all if customers.nil?
    Customer.all
  end
end
