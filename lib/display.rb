# frozen_string_literal: true

# This module prints the game to the console
module Display
  def greeting
    puts "\n\tWelcome to Connect Four!".bold
  end

  def choose_color_message
    puts "\n"
    puts "#{player1.name} choose a color: red(r) or blue(b)".bg_green
  end

  def invalid_input_message
    puts 'Invalid input, try again!'
  end

  def draw_board
    puts "\n"
    puts "\t  1   2   3   4   5   6   7".bold
    puts "\t,---------------------------,"
    (0..41).step(7).reverse_each do |i|
      puts "\t| #{@gameboard.cells[i]} | #{@gameboard.cells[i + 1]} | #{@gameboard.cells[i + 2]} | #{@gameboard.cells[i + 3]} | #{@gameboard.cells[i + 4]} | #{@gameboard.cells[i + 5]} | #{@gameboard.cells[i + 6]} |"
      puts "\t'---------------------------'" if i < 40
    end
    puts "\n"
  end

  def select_column_message(current_player)
    puts "\t#{current_player.name}, it's your turn!".green
    # puts "\t     Your game piece is ."
    puts "To place your '#{current_player.color}', select a column from 1 - 7 :".italic
  end

  def column_full_message
    puts 'This column is full! Please select another column.'.bg_red
  end

  def game_draw_message
    puts "The board is completely full and nobody won. It's a draw!\n ".bold
  end

  def win_message(current_player)
    puts "Congrats #{current_player.name}! You won!"
  end

  def play_again_message
    puts "Would you like to play again? ('y'/'n')"
  end

  def good_bye_message
    puts "Oh ok. See you next time!"
  end
end

# This module makes sure user input matches given criteria
module ValidInput
  include Display

  # def validate_input(allowable_chars, user_input = '')
  #   allowable_chars.map!(&:to_s)
  #   user_input = gets.chomp.downcase
  #   user_input
  # end

  def validate_input(allowable_chars, user_input = '')
    allowable_chars.map!(&:to_s)
    loop do
      user_input = gets.chomp.downcase
      break if allowable_chars.include?(user_input)

      invalid_input_message
    end
    user_input
  end


end

class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
  def default;        "\e[39m#{self}\e[0m" end

  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end

  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end