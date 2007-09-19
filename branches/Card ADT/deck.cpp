/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: deck.c
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
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "deck.h"
#include "deckcard.h"

#define RANDOM_ITERATIONS (2048)
#define DEFAULT_DECK_SIZE (52)
#define MAX_CARD_ARRAY_SIZE	(4*DEFAULT_DECK_SIZE)


Deck::Deck(){
	size = 0;
	TopCard = NULL;
	/* Has a BottomCard variable since determining the BottomCard can be computationally expensive */	
	BottomCard = NULL;
}


Deck::~Deck(){
	/* Delete all the 'new' cards */	
	if( BottomCard != NULL ){
		DeckCard* topCard;
		topCard = BottomCard;
		while( topCard->GetNextCard() != NULL )
		{
			topCard = topCard->GetNextCard();
			delete topCard->GetPrevCard();		
		}
	}
}

int Deck::AddCard(Card* new_card){
	DeckCard* newCard;
	newCard = new DeckCard(new_card->GetValue(), new_card->GetSuit() );
	if( size == 0 ){
		TopCard = newCard;
	}
	else{
		
		DeckCard* lastCard;
		/* Find the last card in the deck */
		lastCard = TopCard;
		while( lastCard->GetPrevCard() != NULL )
		{
			lastCard = lastCard->GetPrevCard();			
		}
		
		lastCard->SetPrevCard(newCard);
		newCard->SetNextCard(lastCard);
	}
	BottomCard = newCard;
	return ++size;
}


Card* Deck::GetTopCard(){
	if( BottomCard != NULL )
	{
		return BottomCard->GetCard();
	}
	return NULL;
}


Card* Deck::GetCard(int index){
	
	DeckCard* tempCard = TopCard;
	if( tempCard == NULL )
	{
		ErrorCheck(__FILE__, __LINE__);
	}
	
	if( index >= size ){
		ErrorCheck(__FILE__, __LINE__);
	}
	
	for( int i = 1; i <= index; i++){
		tempCard = tempCard->GetPrevCard(); 
		if( tempCard == NULL )
		{
			/* Card out of bounds, place error here */
			ErrorCheck(__FILE__, __LINE__);
		}			
	}
	return tempCard->GetCard();
}

int Deck::RemoveCard(int index){

	if( index > size ){
		return DECK_ERROR;
	}
	
	/* For the removal of the only card in the deck */
	if( size == 1 && index == 1 )
	{
		DeckCard* rmCard = TopCard;
		delete	rmCard;
		TopCard = NULL;
		BottomCard = NULL;
		size--;
		return DECK_SUCCESS;	
	}
	
	DeckCard* rmCard = TopCard;
	for( int i = 1; i < index ; i++ ){
		rmCard = rmCard->GetPrevCard();
	}
	
	/* Update the (rmCard + 1) position card to point to (rmCard - 1) and vice versa */
	/* Update the TopCards and BottomCards if they are to be deleted */
	if( rmCard->GetPrevCard() != NULL){
		rmCard->GetPrevCard()->SetNextCard( rmCard->GetNextCard() );	
	}
	else{
		BottomCard = rmCard->GetNextCard();	
	}
	
	if( rmCard->GetNextCard() != NULL){
		rmCard->GetNextCard()->SetPrevCard( rmCard->GetPrevCard() );	
	}	
	else{
		TopCard = rmCard->GetPrevCard();
	}
	
	delete rmCard;
	size--;
	return DECK_SUCCESS;		
}





int Deck::StdFill(bool hasJokers){
	
   for(int i = DIAMONDS; i <= SPADES; i++)
   {
      for(int j = ACE; j <= KING; j++)
      {   
         /* Make a card of all suits and values */
         /* Not including joker */
         Card* NewCard = new Card(j,i);         
         /* Add it to the deck */
         AddCard(NewCard);
      }
   }
   
   if( hasJokers == HAS_JOKERS )
   {
		Card* NewCard = new Card(JOKER, JOKER_RED); 	
		AddCard(NewCard);
		NewCard = new Card(JOKER, JOKER_BLACK); 
		AddCard(NewCard);
	}

   return DECK_SUCCESS;
	
}


void Deck::Shuffle(){

	int random_number[2];
	int deckSize = this->size;
	Card*	tempDeck[deckSize];
	
	/* Place all the cards into an array */	
	for( int i = 0; i < deckSize ; i++ ){
	
		tempDeck[i] = new Card( this->GetTopCard()->GetValue(), this->GetTopCard()->GetSuit() );
		this->RemoveCard(this->size);		
	}
	
	/* Randomise the array */
   /* Set the seed of the random number generator
    * to the current time */
   srand( time(NULL) );

	/* Exchange two cards in the deck 'RANOM_INTERATIONS'
	 * times */
   for( int i = 0; i < RANDOM_ITERATIONS; i++)
   {
      /* Generate two random numbers between 0 and decksize */
      random_number[0] = (rand()%(deckSize));
      random_number[1] = (rand()%(deckSize));
		
		Card* temp_card;
		
      /* Swap two cards corresponding to the random
       * numbers */
      temp_card = (tempDeck[random_number[0]]);

      tempDeck[random_number[0]] = tempDeck[random_number[1]];
      tempDeck[random_number[1]] = temp_card;
   }	
	
	/* Place the contents of the array back into the linked list */
	for( int i = 0 ; i < deckSize ; i++ )
	{
		this->AddCard(tempDeck[i]);
	}
}


int* Deck::FindCardValue(int value){
   int i;
   int j = 0;
   int deckSize = size;
   static int valueIndexes[MAX_CARD_ARRAY_SIZE];   

	for( int i = 0; i < deckSize ; i++ ){
	
		if( this->GetCard(i)->GetValue() == value )
		valueIndexes[j++] = i;	
	}  
   valueIndexes[j] = EOA;
   return valueIndexes;
}

int* Deck::FindCardSuit(int suit){
   int i;
   int j = 0;
   int deckSize = size;
   static int valueIndexes[MAX_CARD_ARRAY_SIZE];   

	for( int i = 0; i < deckSize ; i++ ){
	
		if( this->GetCard(i)->GetSuit() == suit )
		valueIndexes[j++] = i;	
	}  
   valueIndexes[j] = EOA;
   return valueIndexes;
}

int* Deck::FindCardColour(int colour){
   int i;
   int j = 0;
   int deckSize = size;
   static int valueIndexes[MAX_CARD_ARRAY_SIZE];   

	for( int i = 0; i < deckSize ; i++ ){
		if( this->GetCard(i)->GetColour() == colour )
		valueIndexes[j++] = i;	
	}  
   valueIndexes[j] = EOA;
   return valueIndexes;
}


int* Deck::FindCard(Card* card){
   int i;
   int j = 0;
   int deckSize = size;
   static int valueIndexes[MAX_CARD_ARRAY_SIZE];   

	for( int i = 0; i < deckSize ; i++ ){
		if( this->GetCard(i)->GetValue() == card->GetValue() &&
			 this->GetCard(i)->GetSuit() == card->GetSuit())
		valueIndexes[j++] = i;	
	}  
   valueIndexes[j] = EOA;
   return valueIndexes;
}


void Deck::ErrorCheck(char* file, int line){
	printf("Invalid parameter in %s, Line: %d", file, line);
	/* Could throw an exception */
	exit(0);
}




