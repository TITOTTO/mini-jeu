require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"
puts "/n"
puts "Crée ton personnage !"
newchallenger = gets.chomp
newchallenger = HumanPlayer.new(newchallenger)

while !newchallenger.isdead? && (!player1.isdead? || !player2.isdead?)
    Player.ennemi.each do |x|
        x.attacks(newchallenger) if x.life_points >= 0
    end
    break if newchallenger.life_points <= 0
    puts "Vous avez bien encaissé ! Que voulez-vous faire ?"
    puts "/n"
    puts "Ramasser une arme ? Faites : a"
    puts "Ramasser un item ? Faites : s"
    puts "déglinguer #{player1.name} ? faites : 1"
    puts "déglinguer #{player2.name} ? faites : 2"
    action = gets.chomp
    if action == "a"
        newchallenger.search_weapon
    elsif action == "s"
        newchallenger.search_health_pack
    elsif action == "1"
        if player1.life_points <= 0
            puts "Tu as gaspillé un tour en tapant un ennemi mort"
        else
            newchallenger.attacks(player1)
        end
    elsif action == "2"
        if player2.life_points <= 0
            puts "Tu as gaspillé un tour en tapant un ennemi mort"
        else
            newchallenger.attacks(player2)
        end 
    end
    puts "Ce tour est maintenant terminé ! Voici le récap"
    puts "Tu as #{newchallenger.life_points}, #{player1.name} a #{player1.life_points}, #{player2.name} a #{player2.life_points}"
end
if newchallenger.life_points > 0
    puts "Féliciations, tu les a bien niqué, et il te reste encore #{newchallenger.life_points}"
else
    puts "T'es trop naze"
end