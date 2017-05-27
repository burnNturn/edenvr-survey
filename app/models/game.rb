class Game < ApplicationRecord
    
    def add_game_availability(params)
        
    end

    def self.change_game_availability(available, unavailable)
        Game.where(id: available).update_all(available: true) if available.present?
        Game.where(id: unavailable).update_all(available: false) if unavailable.present?
    end
end
