

#include "deckcard.h"

void DeckCard::SetNextCard(DeckCard* nextCard)
{
	this->Next = nextCard;
}


void DeckCard::SetPrevCard(DeckCard* prevCard)
{
	this->Previous = prevCard;	
}
