#include <stdio.h>
#include "card.h"
#include "deck.h"

void CardClassTest(void);
void DeckClassTest(void);
void GetCardTest(void);

int main(int argc, int argv[])
{
	while(1){
		char input;
		printf("Please enter which module to test:\n");
		scanf("%c", &input);
		
		switch(input){
			case 'D':
				DeckClassTest();
				break;
				
			case 'C':
				CardClassTest();
				break;
				
			case 'G':
				GetCardTest();
				break;
				
			default:
				break;	
			
		}
		
	}

	
	return 0;	
}

void GetCardTest(void){

	char input;
	Deck newDeck;

	newDeck.StdFill(HAS_JOKERS);
	newDeck.Shuffle();	
			
	printf("Getting all cards\n");
	
	for( int i = 0; i < newDeck.GetSize(); i++ ){
		Card* tempCard = newDeck.GetCard(i);
		char buffer[200];
		tempCard->Card2String(buffer);
		printf("Card #%d is: %s\n", i+1, buffer);
	}
		
}

void DeckClassTest(void){
	/* Shuffle the cards */
	printf("\n\n\n\n\n\n\n\n\n"
			 "Testing shuffle module.........\n\n");
	
	Deck newDeck;
	newDeck.StdFill(HAS_JOKERS);
	newDeck.Shuffle();
	while( newDeck.GetSize() ){
		char buffer[200];
		newDeck.GetTopCard()->Card2String(buffer);
		printf("The Top Card is: %s\n", buffer);
		printf("Removing top card...\n");
		newDeck.RemoveCard(newDeck.GetSize());
	}		
}

void CardClassTest(void){
	
	Card* TestCard = new Card(6, DIAMONDS);
	Deck	TestDeck;
	
	Card	CardTest(0,0);

	/* Determine boundary for cards and add them to a deck */
	for( int i = DIAMONDS; i <= JOKER_BLACK; i++ )
	{
		if( CardTest.SetSuit(i) == CARD_ERROR )
		{
			printf("Error!\n");	
		}
			
		for( int j = JOKER; j <= KING; j++ )
		{
			if( CardTest.SetValue(j) == CARD_ERROR )
			{
				printf("Error!\n");	
			}
			printf("Value = %d, Suit = %d\n", CardTest.GetValue(), CardTest.GetSuit() );
			
			char buffer[200];
			
			CardTest.Card2String(buffer);
			printf("The card is: %s\n", buffer);

			printf("The card colour is: %s\n", CardTest.Colour2String());			
			
			
			TestDeck.AddCard(&CardTest);
		}
	}

	/* Look at the contents of the deck */
	while( TestDeck.GetSize() ){
		char buffer[200];
		TestDeck.GetTopCard()->Card2String(buffer);
		printf("The Top Card is: %s\n", buffer);
		printf("Removing top card...\n");
		TestDeck.RemoveCard(TestDeck.GetSize());
	}	
	
}




