
require './player'
require './question'

module MathGame

  class Game

    def self.main
      game = Game.new
      game.start
    end

    def initialize
      @players = [
        MathGame::Player.new('Player 1'),
        MathGame::Player.new('Player 2')
      ]
      @current_player = 0
    end

    def start
      greet_players

      until game_over? do
        puts "#{current_player.name}, Here is your question:"
        @new_question = MathGame::Question.new
        @current_question = @new_question.random_question
        lose_life(@current_question)
        current_lives
        swap_players
      end
      puts "#{@players[@current_player].name}, lost it"
    end

    def greet_players
      @players.each do |player|
        puts "Hello #{player.name}"
        puts "Would you like to change your name #{player.name}? (y/N)"

        if gets.chomp == 'y'
          print "change name? "
          player.name = gets.chomp
          puts "Name changed -  #{player.name}\n"
        end
      end
    end

    def current_player
      @players[@current_player]
    end

    def swap_players
      @current_player = (@current_player + 1) % @players.length
    end

    def lose_life(question)
      if question == true
      else
        @players[@current_player].lose_life
      end
    end

    def current_lives

      @players.each do |player|
        puts "#{player.name} has #{player.lives} lives"
      end
    end

    def game_over?
      @players.any? { |player| player.lives == 0 }
    end
  end
end