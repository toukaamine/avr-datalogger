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

#include "card.h"

#define REMOVE_SUCCESS (0)
#define REMOVE_FAIL (-1)
#define EOA (-1)

/* Deck Type Definition */
/* deck_t */
typedef struct
{
   card_t** card;
   int size;      
} deck_t;



/* deck_make:
 * 
 * Parameters : None
 *
 * Returns : Pointer to the newly created deck.
 *
 * Purpose: Initialises a new empty deck.
 * The new deck structure address is returned
 */
deck_t* deck_make(void);

/* deck_delete:
 * 
 * Parameters : deck: The deck to be deleted.
 *
 * Returns : Nothing
 *
 * Purpose: To free all the memory associated with the passed deck.
 * If the deck does not exist, then the program exits with an error.
 *
 * To ensure proper operation, the deck passed to deck_delete should have been
 * made using the deck_make function.
 */
void deck_delete(deck_t* deck);

/* deck_setSize:
 * 
 * Parameters : deck: The deck whose deck size is to be set.
 *					 new_size: The size of the new deck.
 *
 * Returns : Nothing.
 *
 * Purpose: Sets the value of the passed deck to the given new_size value.
 * The size is the number of cards in the deck.
 *
 */
void deck_setSize(deck_t* deck, int new_size);

/* deck_getSize:
 * 
 * Parameters : deck: The deck whose size is to be returned.
 *
 * Returns : The size of the passed deck.
 *
 * Purpose: Returns the number of cards in the passed deck, in an integer form.
 *
 */
int deck_getSize(deck_t* deck);


/* deck_stdFill:
 * 
 * Parameters : new_deck: Deck Pointer for which the new cards will to place in.
 *
 * Returns : Pointer to new_deck. (the input deck)
 *
 * Purpose: Adds a standard deck of 52 cards, which includes
 * ACE, 2, 3.... King of Diamonds, clubs, spades and hearts, to the passed deck.
 *
 */
deck_t* deck_stdFill(deck_t* new_deck);


/* deck_addCard:
 * 
 * Parameters : deck: Deck Pointer for which the new cards will to place in.
 *					 new_card: Card which is to be added to 'deck'.
 *
 * Returns : The size of the updated deck.
 *
 * Purpose: Adds the passed card to the top of the passed deck,
 * the size of the deck is returned. 
 */
int deck_addCard(deck_t* deck, card_t* new_card);

/* deck_topCard:
 * 
 * Parameters : deck: The deck which the top card is to come off.
 *
 * Returns : Card Pointer to the top card on the passed deck.
 *
 * Purpose: Returns the card located on the top of the passed deck.
 */
card_t* deck_topCard(deck_t* deck);


/* deck_findCard:
 * 
 * Parameters : pdeck: The deck where 'pcard' is searched for.
 *					 pcard: The card to find in 'pdeck'
 *
 * Returns : An array holding index information where pcard is found.
 * 
 *		
 * Purpose: To find the card index where 'pcard' is found in 'pdeck'
 * Returns the card index in the given deck where pcard is found.
 * If pcard is not found, then an EOA (-1) is returned in the 0th element of the 
 * returned array.
 *
 * If more than one instance of pcard is found, the successive elements in the
 * returning array hold the indexes of the other instances of pcard in pdeck.
 */
int* deck_findCard(deck_t* pdeck, card_t* pcard);

/* deck_findSuit:
 * 
 * Parameters : pdeck: The deck where 'psuit' is searched for.
 *					 psuit: The suit to search for in 'pdeck'
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed suit in the passed deck.
 *		
 * Purpose: To find cards with 'psuit' in the deck 'pdeck'
 * 
 * The last element in the array is the EOA flag. 
 */
int* deck_findSuit(deck_t* pdeck, enum card_suit psuit);


/* deck_findValue:
 * 
 * Parameters : pdeck: The deck where 'pvalue' is searched for.
 *					 pvalue: The face value to search for in 'pdeck'
 *
 * Returns : Returns an array holding the 'indexes' of
 * cards which have the passed face value in the passed deck.
 *		
 * Purpose: To find cards with a value of 'pvalue' in the deck 'pdeck'.
 * 
 * The last element in the array is the EOA flag. 
 */
int* deck_findValue(deck_t* pdeck, enum card_value pvalue);



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
int deck_shuffle(deck_t* deck);


/* deck_removeCard:
 * 
 * Parameters : deck: The deck which the removed card is to be removed from.
 *					 rm_card: The card to be removed.
 *
 * Returns : The size of the passed deck after the passed card was removed.
 *
 * Purpose: Removes 'rm_card' from deck
 *
 * If the card does not exist, then a 'REMOVE_FAIL' is returned,
 * otherwise a 'REMOVE_SUCCESS' is returned.
 * 
 * The last card in the deck is moved from its
 * position to the position of the deleted card 
 *
 * If more than one instance of a card is found
 * the first instance is deleted.
 */
int deck_removeCard(deck_t* deck, card_t* rm_card);







#endif



