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

    let(:royal_flush) do
      ["Ace of Diamonds",
       "King of Diamonds",
       "Queen of Diamonds",
       "Jack of Diamonds",
       "10 of Diamonds"]
    end

    let(:straight_flush) do
      ["3 of Diamonds",
       "6 of Diamonds",
       "2 of Diamonds",
       "4 of Diamonds",
       "5 of Diamonds"]
    end

    let(:four_of_a_kind) do
      ["8 of Diamonds",
       "8 of Clubs",
       "8 of Spades",
       "8 of Diamonds",
       "7 of Hearts"]
    end

    let(:full_house) do
      ["8 of Diamonds",
       "9 of Diamonds",
       "9 of Diamonds",
       "8 of Diamonds",
       "8 of Diamonds"]
    end

    let(:flush) do
      ["Ace of Diamonds",
       "King of Diamonds",
       "Queen of Diamonds",
       "Jack of Diamonds",
       "10 of Diamonds"]
    end

    let(:straight) do
      ["Ace of Diamonds",
       "King of Diamonds",
       "Queen of Diamonds",
       "Jack of Diamonds",
       "10 of Clubs"]
    end

    let(:high_card) do
      ["King of Diamonds",
       "8 of Clubs",
       "6 of Hearts",
       "Jack of Spades",
       "10 of Clubs"]
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

  describe "#high_card" do
    it "return the highest card" do
      expect(get_high_card(parse_cards(high_card))).to eq(13)
    end
  end

  # Hand method tests
  # =========================================

  describe "#royal_flush?" do
    it "returns true if royal flush" do
      expect(royal_flush?(parse_cards(royal_flush))).to eq(true)
    end
  end

  describe "#straight_flush?" do
    it "returns true if straight flush" do
      expect(straight_flush?(parse_cards(straight_flush))).to eq(true)
    end
  end

  describe "#four_of_a_kind?" do
    it "returns true if four of a kind" do
      expect(four_of_a_kind?(parse_cards(four_of_a_kind))).to eq(true)
    end
  end

  describe "#full_house?" do
    it "returns true if full house" do
      expect(full_house?(parse_cards(full_house))).to eq(true)
    end
  end

  describe "#flush?" do
    it "returns true if flush" do
      expect(flush?(parse_cards(flush))).to eq(true)
    end
  end

  describe "#straight?" do
    it "returns true if straight" do
      expect(straight?(parse_cards(straight))).to eq(true)
    end
  end

end
