## Algorithmic/Logic Test
# =====================================================================

Task: this assignment calculates the best poker hand from five cards.

Review:
-----------------------------------------------------------------------
I started with a simple method, #get_best_hand(cards) and built functionality from there. I decided early on that comparing cards as strings sounded... very difficult. It would be much better if I transform cards into integers; that way I could compare cards against each other for hands, but also, it would be ideal for checking a 'straight' hand where cards are sequential. Toward this plan, I built helper methods that parse the original card string array into an array of card hashes where each card value and suit was represented by a number.

From there, everything started falling in place. The functionality for comparing pairs, two pairs, and suits with matches sounded the most difficult; likewise, the top hands like Royal Flush, Straight, and Flush sounded the most straight forward, so I built individual methods for checking if five cards equated to a particular hand, for example, '#flush?'.

Once I had all of the hand methods down (#flush?, #straight?, etc), I added logic to #get_best_hand that checked the parsed cards from best hand to worst. Since the best hands can also have multiple other hands, like a straight flush, the if/elsif/else block from best hand to worst was necessary.

Frameworks:
-----------------------------------------------------------------------
Nothing to speak of aside from Rspec for testing.

Lessons
-----------------------------------------------------------------------
I used some of the helper methods in other methods frequently which was helpful: #get_matches, #get_high_card, and #get_card_values. #get_matches was a versatile method which helped keep the code dry given it was used for finding pairs, two pairs, three of a kind, four of a kind, and full house.
