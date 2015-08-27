require 'pry'

# string array as argument
def get_best_hand(cards)
  cards = parse_cards(cards)
end

# CARD PARSING
# =============================================================

# turn string array into card hash array
def parse_cards(cards_string_array)
  output = []

  cards_string_array.each do |card|
    output << parse_card(card)
  end

  output
end

# returns card as hash with keys of 'value' and 'suit' where values and suits are transformed into integer values
def parse_card(card_string)
  card_values = { "2"     => 2,
                  "3"     => 3,
                  "4"     => 4,
                  "5"     => 5,
                  "6"     => 6,
                  "7"     => 7,
                  "8"     => 8,
                  "9"     => 9,
                  "10"    => 10,
                  "jack"  => 11,
                  "queen" => 12,
                  "king"  => 13,
                  "ace"   => 14 }

  card = card_string.split(" of ").map{ |e| e.downcase }

  { value: card_values[card[0]], suit: card[1].to_sym }
end

# CARD HELPERS
# =============================================================

# returns hash of card values and repeat counts. Cards without repeats are ignored
# [ 2, 3, 3, 2, 3] => { 2=>2, 3=>3 }
def get_matches(cards)
  values = card_values(cards)
  output = Hash.new(0)

  values.each do |v|
    output.store(v, output[v] + 1)
  end

  output.select do |k, v|
    v > 1
  end
end

def get_high_card(cards)
  card_values(cards).max
end

def card_values(cards)
  values = []

  cards.each do |card|
   values << card[:value]
  end
  values
end

# HAND CHECKERS
# =============================================================

# Rank 1
def royal_flush?(cards)
  flush?(cards) && straight?(cards) && get_high_card(cards) == 14
end

# Rank 2
def straight_flush?(cards)
  flush?(cards) && straight?(cards)
end

# Rank 3
def four_of_a_kind?(cards)
  get_matches(cards).values == [4]
end

# Rank 4
def full_house?(cards)
  return true if get_matches(cards).values.sort == [2, 3]
end

# Rank 5
def flush?(cards)
  suits = []

  cards.each do |card|
    suits << card[:suit]
  end

  suits.uniq.length == 1
end

# Rank 6
def straight?(cards)
  values = card_values(cards).sort

  values.each_with_index do |element, index|
    break if index == (values.length - 1)

    next_element = values[index + 1]
    return false unless next_element - element == 1
  end

  true
end
