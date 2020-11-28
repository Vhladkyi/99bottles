class Bottles
  def initialize
    initialize_bottles
    initialize_actions
  end

  def song
    verses(99, 0)
  end

  def verses(start_count, end_count)
    start_count.downto(end_count).map do |current_count|
      verse(current_count)
    end.join("\n")
  end

  def verse(count_of_bottles)
    "#{bottles[count_of_bottles].capitalize} of beer on the wall, " \
    "#{bottles[count_of_bottles]} of beer.\n" \
    "#{actions[count_of_bottles]}, " \
    "#{bottles[difference(count_of_bottles)]} of beer on the wall.\n"
  end

  private

  attr_reader :bottles, :actions

  def initialize_bottles
    @bottles = Hash.new { |hash, key| hash[key] = "#{key} bottles" }
    @bottles[1] = '1 bottle'
    @bottles[0] = 'no more bottles'
  end

  def initialize_actions
    @actions = Hash.new { |hash, key| hash[key] = 'Take one down and pass it around' }
    @actions[1] = 'Take it down and pass it around'
    @actions[0] = 'Go to the store and buy some more'
  end

  def difference(count_of_bottles)
    count_of_bottles.positive? ? count_of_bottles - 1 : 99
  end
end
