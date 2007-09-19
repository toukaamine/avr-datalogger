/* ENEL428 Assignment #3
 * Deck Card Class
 * Filename: deckcard.h
 * Last modification : 13/09/07
 * Author: Adrian Gin
 *
 * Description: Implemends the Card class as a linked list
 * for use with the Deck Class.
 *	
 */

#ifndef _DECKCARD_
#define _DECKCARD_

#include "card.h"

/* Overlays a linked list on the Card class */
class DeckCard{

public:
	DeckCard(int initValue, int initSuit) : card(initValue, initSuit), Next(0), Previous(0){ }
	virtual ~DeckCard(){ }
	
	virtual void SetNextCard(DeckCard* nextCard);
	virtual void SetPrevCard(DeckCard* prevCard);	
	
	virtual Card*	GetCard(){return &card;}
	
	virtual DeckCard* GetNextCard(){ return Next; }
	virtual DeckCard* GetPrevCard(){ return Previous; }	
	
protected:
	DeckCard* Next;
	Card card;
	DeckCard* Previous;
};



#endif
