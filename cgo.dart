void main() {
  
 
  final List<Player> Players = [];
  
  final PlayerOne = Player([], 'Hans', false);
  final PlayerTwo = Player([], 'Werner', true); 
  final PlayerThree = Player([], 'Achim', false); 
  final PlayerFour =  Player([], 'Johannes', false); 
 
  Players.add(PlayerOne);
  Players.add(PlayerTwo);
  Players.add(PlayerThree);
  Players.add(PlayerFour);
  
  var deck = new Deck();
 
  deck.shuffle();
  
  

  var gameIndex = 0; 
  

  
  for(var x = 0; x < deck.cards.length; x++){
      if(x < 13){
        PlayerOne.playerCards.add(deck.cards[x]);
      } else if(x < 26) {
        PlayerTwo.playerCards.add(deck.cards[x]);
      } else if(x > 26 && x <= 39){
        PlayerThree.playerCards.add(deck.cards[x]);
      } else {
        PlayerFour.playerCards.add(deck.cards[x]);
      }
  }
  
  var myGame = Game(Players);
  var myOponentsArray = [];

  
  for(var i = 0; i < 4; i++){
    if(myGame.checkForSolo(i).isPlayingSolo){
      print('Hellow');
    }; 
  }
  
  print(myOponentsArray[0]);
  


  

  
  
  
  
// print(deck.cardsWithSuit('Diamonds')); //Whatever variable is passed to print(), print() looks for a corresponding toString()
  //of that variable and then executes it. So, if we define toString() for Deck class, we can emulate
  //any function we want
}

class Deck {
  List<Card> cards = []; //List creation and initialization. If not initialized, it is null
  //List is same as array in JAVA. So, saying List<Card> cards essentially means an array of
  //Card objects with the array variable name as cards
  Deck() {
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King'];
    var suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades'];
    
    for(var suit in suits) {
      for(var rank in ranks) {
        var card = new Card(rank, suit);
        cards.add(card); //If list not initialized, list becomes null and add() will not work
      }
    }
  }
  
  toString() {
    return cards.toString();
  }
  
  //Shuffles all cards of the deck randomly
  shuffle() {
    cards.shuffle();
  }
  
  //Short form of function syntax. Long form below
  //Returns all cards of a specific suit
  cardsWithSuit(String suit) {
    // => is implicit return
    //Whatever is evaluated on the right is automatically returned to the left
    return cards.where((card) => card.suit == suit);
    //Long form of function syntax
    //return cards.where((card) { 
      //where() needs a method as param, so passed a nameless method which returns a bool value
      //return card.suit == suit;
    //});
  }
}

class Card {
  String rank;
  String suit;
  
  Card(this.rank, this.suit);
  
  toString() {
    return '$rank of $suit';
  }
}


class Player {
  final String name;
  final List<Card> playerCards;
  final bool isPlayingSolo;
  
  Player(this.playerCards, this.name, this.isPlayingSolo);
  
  void printIT(){
    print('Card');
  }
  
  
}





class Game{
  final List<Player> thePlayers;
  
  Game(this.thePlayers);
  
  Player checkForSolo(int iterator){
      if(thePlayers[iterator].isPlayingSolo == false){
        //print('${thePlayers[iterator].name} is not Playing a solo')
        print(thePlayers[iterator].name);
        return thePlayers[iterator];
      } else {
        print('${thePlayers[iterator].name} is Playing a solo');
        return thePlayers[iterator];
      }
  }
  
  bool checkForCego(){
    return true; 
  }

  
}


class Solo{
  final Player theSolist;
  final List<Player> theOpponents; 
  
  Solo(this.theSolist, this.theOpponents);
  
}







