class Customer < ApplicationRecord
  AGE_ARRAY = [["< 12"], ["12-18"], ["18-26"],
                  ["26-32"], ["32+"]]
  GENDER_ARRAY = [['Male'], ['Female'], ['Decline to State']]
  RACE_ARRAY = [["White" ], ["Asian"], ["Black"],
                  ["Other ethnic groups"], ["Native American"]]
  INCOME_ARRAY = [["< $30,000"], ["$30,000 - $50,000"],
                    ["$50,000 - $80,000"], ["$80,000+"]]

  validates  :game, :age, :gender, :race, :income,
    :group_type, :group_size, presence: true
    
  def self.search(paramz)
    #keyword.present? ? Customer.where(game: keyword) : Customer.all
    gender = paramz[:Gender]
    game = paramz[:game].present? ? paramz[:game] : "%%"
    Customer.where('game LIKE ?', "%#{game}%").where("gender LIKE ?", "%#{gender}%")
  end
end
