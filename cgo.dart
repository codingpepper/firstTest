import 'dart:io';

void main() {
  List<Player> Players = [];

  // Making Maps out of it because of the key features
  var PlayerOne = Player([], 'Hans');
  var PlayerTwo = Player([], 'Werner');
  var PlayerThree = Player([], 'Achim');
  var PlayerFour = Player([], 'Johannes');

  bool weArePlayingSolo = false;

  Players.add(PlayerOne);
  Players.add(PlayerTwo);
  Players.add(PlayerThree);
  Players.add(PlayerFour);

  var deck = new Deck();

  deck.shuffle();
  print(deck.cards[0].cardScore);

  var tableCards = [];

  var gameIndex = 0;

  // Distribute Cards To Player
  for (var x = 0; x < deck.cards.length; x++) {
    if (x < 13) {
      PlayerOne.playerCards.add(deck.cards[x]);
    } else if (x < 26) {
      PlayerTwo.playerCards.add(deck.cards[x]);
    } else if (x > 26 && x <= 39) {
      PlayerThree.playerCards.add(deck.cards[x]);
    } else {
      PlayerFour.playerCards.add(deck.cards[x]);
    }
  }

  var myGame = Game(Players);

  //var myTableCards = CardsOnTheTable();

  var myOponentsArray = [];

  for (var i = 0; i < Players.length; i++) {
    myGame.checkForSolo(i);
    if (Players[i]._isPlayingSolo == true) {
      print('${Players[i].name} is Playing a Solo');
      var mySolo = Solo(Players[i], Players);
      print('The solist is');
      print(mySolo.theSolist.name);
      weArePlayingSolo = true;
    }
    print(Players[i]._isPlayingSolo == true);
  }

  if (weArePlayingSolo) {
    for (var i = 0; i < 2; i++) {
      print('${i} RoundCounter');
      for (var x = 0; x < 4; x++) {
        // stdout.write("${Players[x].name} Which Card you want to take ? ");
        // indexToRemove = stdin.readLineSync();
        // Create Map from Players and their cards thrown on the table for Every Round
        var myLast = {
          'PlayerCards': Players[x].playerCards.last,
          'Player': Players[x]
        };
        tableCards.add(myLast);
        Players[x].playerCards.removeLast();
        //print(tableCards);
        //print(myTableCards._tableCards[0]);
        //print( 'Player Number Cards ${Players[x].name} ${Players[x].playerCards} ${Players[x].playerCards.length}');
      }
      // Check for highest Card on the table and which player is owning it
      var cardCheckerVar = 0;
      var roundWinnerVar = null;

      for (var c = 0; c <= 3; c++) {
        if (tableCards[c]['PlayerCards'].cardScore > cardCheckerVar) {
          cardCheckerVar = tableCards[c]['PlayerCards'].cardScore;
          print('${cardCheckerVar} + CardCeckerVar');
          roundWinnerVar = tableCards[c]['Player'].name;
          //print("Winner is ${roundWinnerVar}");
        }
        print(
            '${tableCards[c]['PlayerCards'].cardScore} + ${tableCards[c]['Player'].name}');
      }
      print('${roundWinnerVar} is the Winner of the Round');
    }
  }

  //print(tableCards[0]['Player'].name);

  //print(deck.cardsWithSuit('Diamonds')); //Whatever variable is passed to print(), print() looks for a corresponding toString()
  //of that variable and then executes it. So, if we define toString() for Deck class, we can emulate
  //any function we want
}

class Deck {
  List<Card> cards =
      []; //List creation and initialization. If not initialized, it is null
  //List is same as array in JAVA. So, saying List<Card> cards essentially means an array of
  //Card objects with the array variable name as cards
  Deck() {
    var ranks = [
      'Ace',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Jack',
      'Queen',
      'King'
    ];
    var suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades'];
    var cardScores = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

    for (var suit in suits) {
      for (var i = 0; i < ranks.length; i++) {
        var card = new Card(ranks[i], suit, cardScores[i]);
        cards.add(
            card); //If list not initialized, list becomes null and add() will not work
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
  int cardScore;

  Card(this.rank, this.suit, this.cardScore);

  toString() {
    return '$rank of $suit';
  }
}

class Player {
  var name;
  var playerCards;
  bool _isPlayingSolo = false;

  Player(this.playerCards, this.name);

  set isPlayingSolo(bool isPlayingSolo) {
    this._isPlayingSolo = isPlayingSolo;
  }

  void printIT() {
    print('Card');
  }
}

class Game {
  final List<Player> thePlayers;
  bool _activePlayer = false;

  Game(this.thePlayers);

  void checkForSolo(int iterator) {
    stdout.write("${thePlayers[iterator].name} you want to play solo ? ");
    var myBool = stdin.readLineSync();
    if (myBool == 'Yes') {
      print('Setting to True');
      thePlayers[iterator].isPlayingSolo = true;
    }
  }

  set activePlayer(bool activePlayer) {
    this._activePlayer = activePlayer;
  }

  bool checkForCego() {
    return true;
  }
}

class Solo {
  final Player theSolist;
  List<Player> theOpponents;

  Solo(this.theSolist, this.theOpponents);
}

// class CardsOnTheTable {
//   var _tableCards = [];

//   CardsOnTheTable();

//   set tableCards(tableCards) {
//     this._tableCards.add(tableCards);
//   }

//   void printTableCards() {
//     _tableCards[0];
//   }
// }
