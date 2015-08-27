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
