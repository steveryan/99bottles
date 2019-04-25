require "pry"
class Bottles
  attr_accessor :lyrics
  def initialize
  end

  def write_x_number_of_bottles_of_beer(number)
    if number > 1
      "#{number} bottles of beer"
    elsif number == 1
      "#{number} bottle of beer"
    elsif number == 0
      "no more bottles of beer"
    end
  end

  def write_second_line(number)
    if number > 0
      "Take #{number > 1 ? "one":"it"} down and pass it around, #{write_x_number_of_bottles_of_beer(number-1)} on the wall."
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end

  def verse(number)
    <<~HEREDOC
    #{number == 0 ? write_x_number_of_bottles_of_beer(number).capitalize : write_x_number_of_bottles_of_beer(number)} on the wall, #{write_x_number_of_bottles_of_beer(number)}.
    #{write_second_line(number)}
    HEREDOC
  end

  def create_verses(verse_array)
    lyrics_array = verse_array.map { |number| verse(number) }
  end

  def verses(high_num, low_num)
    verse_array = (low_num..high_num).to_a.reverse
    <<~HEREDOC
    #{create_verses(verse_array).join("\n").strip}
    HEREDOC
  end

  def song
    verses(99,0)
  end


end
