require "pry"
require_relative 'gameplayer'

class Game < Gameplayer

    attr_accessor :humanplayer, :ennemies, :life_points, :weapon_level
    @@ennemies = []

    robot1 = Gameplayer.new("Robot1")
    robot2 = Gameplayer.new("Robot2")
    robot3 = Gameplayer.new("Robot3")
    robot4 = Gameplayer.new("Robot4")

    def initialize(name)
        @humanplayer = name
        @life_points = 100
        @weapon_level = 1
        @@ennemies = Gameplayer.ennemi
    end

    def kill_player(player)
        index = 0
        for x in 0..(@@ennemies.length - 1)
            index = x if Game.badguys[x].name == player
        end
        @@ennemies.delete_at(index)
    end

    def is_still_ongoing?
        return true if @life_points > 0 && @@ennemies.length > 0
        return false
    end

    def show_players
        puts "Le joueur #{name} a encore #{life_points} PV il reste #{@@ennemies.length} robots en vie "
    end

    def menu
        puts "Vous avez bien encaissé ! Que voulez-vous faire ?"
        puts "/n"
        puts "Ramasser une arme ? Faites : a"
        puts "Ramasser un item ? Faites : s"
        if @@ennemies.length == 4
            puts "déglinguer #{Game.badguys[0].name} ? faites : 1"
            puts "déglinguer #{Game.badguys[1].name} ? faites : 2"
            puts "déglinguer #{Game.badguys[2].name} ? faites : 3"
            puts "déglinguer #{Game.badguys[3].name} ? faites : 4"
        elsif @@ennemies.length == 3
            puts "déglinguer #{Game.badguys[0].name} ? faites : 1"
            puts "déglinguer #{Game.badguys[1].name} ? faites : 2"
            puts "déglinguer #{Game.badguys[2].name} ? faites : 3"
        elsif @@ennemies.length == 2
            puts "déglinguer #{Game.badguys[0].name} ? faites : 1"
            puts "déglinguer #{Game.badguys[1].name} ? faites : 2"
        else
            puts "déglinguer #{Game.badguys[0].name} ? faites : 1"
        end
    end

    def menu_choice(choix)
        if choix == "a"
            self.search_weapon
        elsif choix == "s"
            self.search_health_pack
        elsif choix == "1"
            self.attacks(robot1)
        elsif choix == "2"
            self.attacks(robot2)
        elsif choix == "3"
            self.attacks(robot3)
        elsif choix == "4"
            self.attacks(robot4)
        end
    end

    def self.badguys
        @@ennemies
    end
end

binding.pry