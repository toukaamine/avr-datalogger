/* ENEL428 Assignment #3
 * Deck Card Class
 * Filename: deckcard.cpp
 * Last modification : 13/09/07
 * Author: Adrian Gin
 *
 * Description: Implemends the Card class as a linked list
 * for use with the Deck Class.
 *	
 */

#include "deckcard.h"

void DeckCard::SetNextCard(DeckCard* nextCard)
{
	this->Next = nextCard;
}


void DeckCard::SetPrevCard(DeckCard* prevCard)
{
	this->Previous = prevCard;	
}
