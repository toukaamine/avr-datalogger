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

#if 0 
/* deck_make:
 * 
 * Parameters : None
 *
 * Returns : Pointer to the newly created deck.
 *
 * Purpose: Initialises a new empty deck.
 * The new deck structure address is returned
 */
deck_t* deck_make(void)
{
   deck_t* new_deck;
   /* Allocate some memory for a new deck */
   new_deck = malloc(sizeof(deck_t));
   memCheck_malloc(new_deck,__FILE__, __LINE__);
   
   /* Initialise card array */
   new_deck->card = (card_t**)malloc(sizeof(card_t*));
   memCheck_malloc(new_deck->card,__FILE__, __LINE__);
   
   /* Set deck size to 0 */
   deck_setSize(new_deck, 0);

   return new_deck;

}

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
void deck_delete(deck_t* deck)
{
   int deck_size;
	int i;
	checkValidPointer(deck,__FILE__, __LINE__);
	deck_size = deck_getSize(deck);
	for(i = 0; i < deck_size; i++)
	{
		card_delete(deck->card[i]);
	}
	
	free(deck->card);
	free(deck);
}



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
void deck_setSize(deck_t* deck, int new_size)
{
	checkValidPointer(deck,__FILE__, __LINE__);	
	deck->size = new_size;
}

/* deck_getSize:
 * 
 * Parameters : deck: The deck whose size is to be returned.
 *
 * Returns : The size of the passed deck.
 *
 * Purpose: Returns the number of cards in the passed deck, in an integer form.
 *
 */
int deck_getSize(deck_t* deck)
{
	checkValidPointer(deck,__FILE__, __LINE__);	
	return deck->size;
}




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
deck_t* deck_stdFill(deck_t* new_deck)
{
   int i;   
   int j;

   card_t*  new_card;
   
   checkValidPointer(new_deck,__FILE__, __LINE__);
   
   for(i = DIAMONDS; i <= SPADES; i++)
   {
      for(j = ACE; j <= KING; j++)
      {   
         /* Make a card of all suits and values */
         /* Not including joker */
         new_card = card_make(j,i);
         
         /* Add it to the deck */
         deck_addCard(new_deck, new_card);
      }
   }

   deck_setSize(new_deck, KING*(SPADES+1) );

   return new_deck;
}


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
int deck_addCard(deck_t* deck, card_t* new_card)
{
	int decksize;
   card_t* tempcard;

   /* Check that the passed pointers are valid */
   checkValidPointer(deck,__FILE__, __LINE__);
   checkValidPointer(new_card,__FILE__, __LINE__);   
   
	decksize = deck_getSize(deck);
		
   /* Increment deck size by 1 */
   deck->card = (card_t**)realloc((void*)deck->card, 
											 (sizeof(card_t*)*(deck->size)+1));
											 
   memCheck_malloc(deck->card,__FILE__, __LINE__);
   
   tempcard = card_make(card_GetValue(new_card), 
								card_GetSuit(new_card));
								
   /* Add new card to the top of the deck */
   deck->card[decksize] = tempcard;

	/* Update the size of the deck */
	deck_setSize(deck, decksize+1);
   return deck_getSize(deck);
}

/* deck_topCard:
 * 
 * Parameters : deck: The deck which the top card is to come off.
 *
 * Returns : Card Pointer to the top card on the passed deck.
 *
 * Purpose: Returns the card located on the top of the passed deck.
 */
card_t* deck_topCard(deck_t* deck)
{
   int decksize;
   
	checkValidPointer(deck,__FILE__, __LINE__);	
	
	/* Return a null pointer if there
	 * is no 'TOP CARD' */
	
	decksize = deck_getSize(deck);
	
	if(decksize >= 1)
	{
		return (deck->card[decksize-1]);
	}
	else
	{
		printf("Warning: Access to invalid top card<BR>\n");
		return NULL;
	}
}



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
int* deck_findCard(deck_t* pdeck, card_t* pcard)
{
   int i;
   int j = 0;
   int decksize;
   static int cardIndexes[10];   

   /* Check the validity of the passed arguments */
   checkValidPointer(pdeck,__FILE__, __LINE__);
   checkValidPointer(pcard,__FILE__, __LINE__);   

	decksize = deck_getSize(pdeck);
   
   for( i = (decksize-1); i >=0 ; i--)
   {
      /* If we find a matching card in the deck, record it's index */		
      if(( card_GetSuit(pdeck->card[i])  == card_GetSuit(pcard)) &&
         ( card_GetValue(pdeck->card[i]) == card_GetValue(pcard)) )
      {
         cardIndexes[j++] = i;
      }
   }
   
   cardIndexes[j] = EOA;

   return cardIndexes;
}


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
int* deck_findSuit(deck_t* pdeck, enum card_suit psuit)
{
   int i;
   int j = 0;
   int decksize;
   static int suitIndexes[13*10]; 
	  
   checkValidPointer(pdeck,__FILE__, __LINE__);
   
   decksize = deck_getSize(pdeck);
   
   for( i = (decksize-1); i >=0 ; i--)
   {
      if(card_GetSuit(pdeck->card[i]) == psuit)
      {
         suitIndexes[j++] = i;
      }
   }
   suitIndexes[j] = EOA;
   return suitIndexes;
}


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
int* deck_findValue(deck_t* pdeck, enum card_value pvalue)
{
   int i;
   int j = 0;
   int decksize;
   static int valueIndexes[4*10];   

   checkValidPointer(pdeck,__FILE__, __LINE__);
   
	decksize = deck_getSize(pdeck);
   
   for( i = (decksize-1); i >=0 ; i--)
   {
      if(card_GetValue(pdeck->card[i]) == pvalue)
      {
         valueIndexes[j++] = i;
      }
   }
   
   valueIndexes[j] = EOA;

   return valueIndexes;
}


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
int deck_shuffle(deck_t* deck)
{
   int random_number[2];
   int i;
	int decksize;

   card_t* temp_card;
   checkValidPointer(deck,__FILE__, __LINE__); 
   
   decksize = deck_getSize(deck);
   
   /* Set the seed of the random number generator
    * to the current time */
   srand( time(NULL) );

	/* Exchange two cards in the deck 'RANOM_INTERATIONS'
	 * times */
   for( i = 0; i < RANDOM_ITERATIONS; i++)
   {
      /* Generate two random numbers between 0 and decksize */
      random_number[0] = (rand()%(decksize));
      random_number[1] = (rand()%(decksize));

      /* Swap two cards corresponding to the random
       * numbers */
      temp_card = (deck->card[random_number[0]]);

      deck->card[random_number[0]] = deck->card[random_number[1]];

      deck->card[random_number[1]] = temp_card;
   }

   return 0;

}

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
int deck_removeCard(deck_t* deck, card_t* rm_card)
{
   int* rm_CardIndex;
   int decksize;
   
   checkValidPointer(deck,__FILE__, __LINE__); 
   checkValidPointer(rm_card,__FILE__, __LINE__);    
   
   decksize = deck_getSize(deck);
   /* Find the passed card in the deck*/
   rm_CardIndex = deck_findCard(deck, rm_card);
   
   /* Remove the first instance of it */
   if(rm_CardIndex[0] == EOA)
   {
      return REMOVE_FAIL; 
   }

   /* If there is only 1 card left
    * and if that is to be removed,
    * then remove it and return */
   card_delete(deck->card[rm_CardIndex[0]]);
   if( rm_CardIndex[0] == 0 ) 
   {
   	deck_setSize(deck,0);
   	return REMOVE_SUCCESS;
   }
   
   /* Move the last card in the deck to the removed
    * card's position */
   if( rm_CardIndex[0] != (decksize - 1) )
   {
   	deck->card[rm_CardIndex[0]] = deck->card[decksize-1];
   }
   
   
   deck_setSize(deck, decksize-1);

   return REMOVE_SUCCESS;
}







#endif


