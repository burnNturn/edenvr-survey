class Game < ApplicationRecord
    
    def add_game_availability(params)
        
    end

    def self.change_game_availability(available, unavailable)
        Game.where(id: available).update_all(available: true)
        Game.where(id: unavailable).update_all(available: false)
    end
end
