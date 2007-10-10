/* ENEL428 Assignment #3
 * Hand Class
 * Filename: hand.h
 * Last modification : 10/10/07
 * Author: Adrian Gin
 *
 * Description: Hand class made for use with the Card classes.
 *	The hand class is a facade of the deck class. It forwards function calls
 * to the respective deck class.
 *
 * Operation is exactly the same, but some functionality is removed to 
 * simplify the interface. Functions removed are namely the Standard Fill,
 * Shuffle and GetTopCard functions.
 */

#ifndef _HAND_
#define _HAND_

#include "deck.h"


class Hand{

public:
	Hand();
	virtual ~Hand();
	
/* AddCard:
 * 
 * Parameters : new_card: Card which is to be added to 'deck'.
 *
 * Returns : The size of the updated deck.
 *
 * Purpose: Adds the passed card to the top of the passed deck,
 * the size of the deck is returned. The deck acts like a stack as in, a LIFO.
 */
	virtual int AddCard(Card* new_card){return Cards.AddCard(new_card); }
	
/* GetSize:
 * 
 * Parameters : None.
 *
 * Returns : The size of the passed deck.
 *
 * Purpose: Returns the number of cards in the passed deck, in an integer form.
 *
 */
	virtual int GetSize(){return Cards.GetSize();}

	
/* RemoveCard
 * 
 * Parameters : The card index to be removed.
 *
 * Returns : Deck Status Code
 *
 * Purpose: Deletes the 'index'th card of the deck. The TopCard is card is the size of the deck.
 * 			If the index is out of range, then DECK_ERROR is returned.
 */
	virtual int RemoveCard(int index){ return Cards.RemoveCard(index); }

/* GetCard:
 * 
 * Parameters : index: Which card in the deck to return. Index must be equal to larger
 * 				 than 0 and be less than the size of the deck.
 *
 * Returns : Card Pointer to the card referred to by 'index'. Null is returned if the
 *				 index is out of range.
 *
 * Purpose: Returns 'index'th card in the deck. An index = 0 is the bottom card
 * and an index of 'size - 1' is the top card.
 */	
	virtual Card* GetCard(int index){return Cards.GetCard(index);}
		

/* FindCardValue:
 * 
 * Parameters : value: The face value to search for in the deck
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed face value.
 *		
 * Purpose: To find cards with a particular value
 * 
 * The last element in the array is the EOA flag. 
 */
virtual int* FindCardValue(int value){return Cards.FindCardValue(value);}

/* FindCardSuit:
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
virtual int* FindCardSuit(int suit){return Cards.FindCardSuit(suit);}


/* FindCardColour:
 * 
 * Parameters : colour: The colour to search for 'RED' or 'BLACK' as defined in
 *					 'card.h'.
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed colour.
 *		
 * Purpose: To find cards with a particular colour
 * 
 * The last element in the array is the EOA flag. 
 */
virtual int* FindCardColour(int colour){return Cards.FindCardColour(colour);}


/* FindCard:
 * 
 * Parameters : card: The card whose parameters are to be matched
 *
 * Returns : An array holding index information where the card may be found.
 * 
 * Purpose: To find the card indexes where 'card' is found in the deck.
 *
 * If more than one instance of 'card' is found, the successive elements in the
 * returning array hold the indexes of the other instances of 'card' in the deck.
 */
virtual int* FindCard(Card* card){return Cards.FindCard(card);}

protected:
	Deck	Cards;
};



#endif
