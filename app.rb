require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "A ma gauche, nous retrouvon #{player1.name} avec #{player1.life_points}, à ma droite #{player2.name} avec #{player2.life_points}"
puts "C'est partie pour se taper dessus !"

while !player1.isdead? && !player2.isdead?
    player1.attacks(player2)
    player2.attacks(player1) if player2.life_points > 0
    puts "Le joueur #{player1.name} a #{player1.life_points}, le joueur #{player2.name} a #{player2.life_points}"
    puts "\n"
end

if player1.life_points < 0
    puts "Le vainqueur est #{player2.name}"
else
    puts "Le vainqueur est #{player1.name}"
end

binding.pry