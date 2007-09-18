/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: deck.h
 * Last modification : 13/09/06
 * Author: Adrian Gin
 *
 * Description: Deck Abstract Data Type.
 *	
 *	This source file uses the card_t ADT described in card.h
 *
 *	All the functions associated with the deck_t ADT are
 * implemented in deck.c
 */

#ifndef _DECK_
#define _DECK_

#define REMOVE_SUCCESS (0)
#define REMOVE_FAIL (-1)
#define EOA (-1)

class Card;
class DeckCard;

typedef enum  { DECK_ERROR = 0, DECK_SUCCESS } DeckStatusCodes;
typedef enum  { HAS_JOKERS = 0, NO_JOKERS } JokerStates;

class Deck{

public:
	Deck();
	virtual ~Deck();
	
/* deck_addCard:
 * 
 * Parameters : deck: Deck Pointer for which the new cards will to place in.
 *					 new_card: Card which is to be added to 'deck'.
 *
 * Returns : The size of the updated deck.
 *
 * Purpose: Adds the passed card to the top of the passed deck,
 * the size of the deck is returned. The deck acts like a stack as in, a LIFO
 */
	virtual int AddCard(Card* new_card);
	
/* deck_getSize:
 * 
 * Parameters : None.
 *
 * Returns : The size of the passed deck.
 *
 * Purpose: Returns the number of cards in the passed deck, in an integer form.
 *
 */
	virtual int GetSize(){return size;}


/* GetTopCard:
 * 
 * Parameters : None.
 *
 * Returns : Card Pointer to the top card on the passed deck.
 *
 * Purpose: Returns the card located on the top of the passed deck.
 */
	virtual Card* GetTopCard();
	
/* RemoveCard
 * 
 * Parameters : The card index to be removed.
 *
 * Returns : Deck Status Code
 *
 * Purpose: Deletes the 'n'th card of the deck. The TopCard is card is the size of the deck.
 */
	virtual int RemoveCard(int index);	

/* GetTopCard:
 * 
 * Parameters : index: Which card in the linked list to return.
 *
 * Returns : Card Pointer to the card referred to by 'index'.
 *
 * Purpose: Returns 'n'th card in the deck. An index = 0 is the bottom card
 * and an index of 'size - 1' is the top card.
 */	
	virtual Card* GetCard(int index);
		

/* deck_stdFill:
 * 
 * Parameters : hasJokers, whether 2 (a red and black) jokers are added to the deck.
 *
 * Returns : 
 *
 * Purpose: Adds a standard deck of 52 cards, which includes
 * ACE, 2, 3.... King of Diamonds, clubs, spades and hearts, to the passed deck.
 *
 */
	virtual int StdFill(bool hasJokers);


/* deck_shuffle:
 * 
 * Parameters : deck: The deck to have its card's shuffled
 *
 * Returns : Returns a 0 to signify a successful shuffle.
 *
 * Purpose: Shuffles the cards in the passed deck
 * Uses the time functions to generate the random seed and random shuffle
 * sequence.
 *
 * The deck is shuffled by constantly swapping two
 * random cards of the deck.
 */
virtual void Shuffle();


/* deck_findValue:
 * 
 * Parameters : pvalue: The face value to search for in 'pdeck'
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed face value.
 *		
 * Purpose: To find cards with a particular value
 * 
 * The last element in the array is the EOA flag. 
 */
virtual int* FindCardValue(int value);

/* deck_findSuit:
 * 
 * Parameters : suit: The suit to search for.
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed suit.
 *		
 * Purpose: To find cards with 'suit' in the deck.
 * 
 * The last element in the array is the EOA flag. 
 */
virtual int* FindCardSuit(int suit);


/* FindColour:
 * 
 * Parameters : colour: The colour to search for.
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed colour.
 *		
 * Purpose: To find cards with a particular colour
 * 
 * The last element in the array is the EOA flag. 
 */
virtual int* FindCardColour(int colour);


/* FindCard:
 * 
 * Parameters : Card: The card whose parameters are to be matched
 *
 * Returns : An array holding index information where the card may be found.
 * 
 * Purpose: To find the card index where 'card' is found in the deck.
 *
 * If more than one instance of 'card' is found, the successive elements in the
 * returning array hold the indexes of the other instances of pcard in pdeck.
 */
virtual int* FindCard(Card* card);
	
protected:
	DeckCard*	TopCard;
	DeckCard*	BottomCard;
	int size;	
	
	void ErrorCheck(char* file, int line);
	
};


#endif

#if 0

















#endif



