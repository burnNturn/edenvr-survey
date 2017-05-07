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
  validates :date, :machine, presence:true
  validates :game, inclusion: { in: game_names.keys, message: "Please Select a Game" }
  validates :age, inclusion: { in: age_ranges.keys, message: "Please Select Age Range"}
  validates :gender, inclusion: { in: gender_fields.keys, message: "Please Select Gender"}
  validates :race, inclusion: { in: race_fields.keys, message: "Please Select Race"}
  validates :income, inclusion: { in: income_fields.keys, message: "Please Select Income Range"}
  validates :group_type, inclusion: { in: group_types.keys, message: "Please Select Group Type" }
  validates :group_size, presence: {message: "Can't be blank"}

  def self.search(paramz)
    byebug
    start_date = paramz[:start_date].empty? ? ("2000-01-01").to_date : paramz[:start_date].to_date
    end_date = paramz[:end_date].empty? ? ("2100-01-01").to_date : paramz[:end_date].to_date
    age = paramz[:age].empty? ? "%%" : paramz[:age]
    gender = paramz[:gender].empty? ? "%%" : paramz[:gender]
    income = paramz[:income].empty? ? "%%" : paramz[:income]
    race = paramz[:race].empty? ? "%%" : paramz[:race]
    game = paramz[:game].empty? ? "%%" : paramz[:game]
    customers = Customer.where(date: start_date..end_date).where('game LIKE ?', "#{game}").where("gender LIKE ?", "#{gender}").where("age LIKE ?", "#{age}").where("income LIKE ?", "#{income}").where("race LIKE ?", "#{race}")
  end

end
