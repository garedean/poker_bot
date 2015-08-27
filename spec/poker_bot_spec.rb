require "poker_bot"

describe "poker bot" do
  let(:cards_as_string_array) do
      ["Ace of Diamonds",
       "King of Diamonds",
       "Queen of Diamonds",
       "Jack of Diamonds",
       "10 of Diamonds"]
    end

    let(:cards_as_hash_array) do
      [{value: 14, suit: :diamonds},
       {value: 13, suit: :diamonds},
       {value: 12, suit: :diamonds},
       {value: 11, suit: :diamonds},
       {value: 10, suit: :diamonds}]
    end

  # Helper method tests
  # =========================================

  describe "#parse_card" do
    it "returns a hash of a card's value (as integer) and suit" do
      expect(parse_card("Ace of Diamonds")).to eq({value: 14, suit: :diamonds})
    end
  end

  describe "#parse_cards" do
    it "returns an array of hashes representing cards" do
      expect(parse_cards(cards_as_string_array)).to eq(cards_as_hash_array)
    end
  end
end
