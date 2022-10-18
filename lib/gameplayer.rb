require "pry"

class Gameplayer

    attr_accessor :life_points, :name, :weapon_level
    @@all_ennemi = []

    def initialize(name)
        @name = name
        @life_points = 10
        @@all_ennemi << self
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        return "#{name} est mort" if @life_points <= 0
        return "Il reste #{@life_points} PV à #{name}"
    end

    def attacks(player)
        puts "#{name} attacks #{player.name}"
        damage = compute_damage
        puts "#{player.name} a prit #{damage} dégats"
        player.gets_damage(damage)
    end

    def self.ennemi
        @@all_ennemi
    end

    def isdead?
        return true if @life_points <= 0
        return false
    end
end

    def show_state
        return "Le joueur #{name} a #{life_points} PV et un niveau d'arme de #{weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu as trouver une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            puts "Génial l'arme que tu as trouvé est meilleur que la précédente"
            @weapon_level = new_weapon
        else
            puts "Cette arme est déguelasse, on va la laisser par terre"
        end
    end

    def search_health_pack
        lancer = rand(1..6)
        if lancer == 1
            puts "T'as rien trouvé"
        elsif lancer == 6
            puts "Jackpot, une trousse de secours de 80 HP !"
            if @life_points + 80 > 100
                @life_points = 100
            else
                @life_points = @life_points + 80
            end
        else
            puts "Tu as trouvé une petite trousse de secours de 50 HP !"
            if @life_points + 50 > 100
                @life_points = 100
            else
                @life_points = @life_points + 50
            end
        end
    end