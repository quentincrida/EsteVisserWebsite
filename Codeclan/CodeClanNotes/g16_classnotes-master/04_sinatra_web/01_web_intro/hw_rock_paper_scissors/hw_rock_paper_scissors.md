## Sinatra Homework - Rock Paper Scissors

Create a simple sinatra app to allow the user to play rock, paper, scissors in their browser.

- Create a 'Game' class with a method called play(hand1, hand2) that takes in 2 strings, i.e play("rock", "scissors")

- The method compares the 2 hands and returns the winner based on Rock, Paper, Scissor rules. (Just return the hand as a string, i.e. "Rock")

- You should be able to go to /rock/scissors and return a string, e.g. "rock wins" to the page.

### Extensions:

- Add an ERB view file for returning the result of the game, rather than just sending a string.

- Add a welcome page (and a route to get it) to explain the rules before the user picks their move. Add a link to this on the result view.

- Add some CSS to either/both of your pages.

### Further extension:

Think about how you might differentiate between the two people playing the game - currently we don't know WHO has won, just which hand. If we think of '/rock/scissors' as being Player 1 plays Rock, and Player 2 plays Scissors, how might we be able to give the feedback of 'Player 1 wins by playing Rock!' rather than just 'Rock wins!'?
