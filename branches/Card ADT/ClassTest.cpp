#include <stdio.h>
#include "card.h"
#include "deck.h"

void CardClassTest(void);
void DeckClassTest(void);
void GetCardTest(void);
void RemoveCardfromMainDeck(void);
void printMainDeck(void);
void seekMainDeckValue(void);
void seekMainDeckSuit(void);
void seekMainDeckColour(void);
void seekMainDeckCard(void);

Deck MainDeck;


int main(int argc, int argv[])
{

	MainDeck.StdFill(HAS_JOKERS);
	MainDeck.Shuffle();	
	
	while(1){
		char input;
		printf("Please enter which module to test:\n");
		scanf("%c", &input);
		
		switch(input){
			/* Deck Test Function, Makes a new deck, shuffles it and removes all the cards from it */
			case 'D':
				DeckClassTest();
				break;
			
			/* Tests boundary for Card class */	
			case 'C':
				CardClassTest();
				break;
			
				
			case 'G':
				GetCardTest();
				break;
			
			/* Prompts the user to remove a card from a deck */
			case 'R':
				RemoveCardfromMainDeck();
				printMainDeck();
				break;	
				
			case 'P':
				printMainDeck();
				break;	
			
			/* Seeks a value from the main deck and returns it's index */
			case 'V':
				seekMainDeckValue();
				break;
				
			/* Seeks a suit from the main deck and returns it's index */
			case 'S':
				seekMainDeckSuit();
				break;				
			
			/* Seeks a colour from the main deck and returns it's index */	
			case 'O':
				seekMainDeckColour();
				break;

			/* Seeks a card from the main deck and returns it's index */
			case 'F':
				seekMainDeckCard();
				break;				
				
			default:
				break;	
			
		}
	}

	
	return 0;	
}

void seekMainDeckValue(void){

	int input;
	int* cardIndexArray;

	printf("Which card value to seek?\n");
	printf("Format: <x> (without the < and >)\n"
			 "Where x is the value to find (0 = JOKER, 1 = ACE .. 13 = KING)\n");
	scanf("%d", &input);	
	
	cardIndexArray = MainDeck.FindCardValue(input);
	
	printf("Cards with value %s are found at: ", card_valueString[input]);
	while(*cardIndexArray != EOA )
	{
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");
}

void seekMainDeckCard(void){
	int Value, Suit;
	Card	tempCard(0,0);
	int* cardIndexArray;

	printf("Which card to seek?\n");
	printf("Format: <x y> (without the < and >)\n"
			 "Where x is the value to find (0 = JOKER, 1 = ACE .. 13 = KING)\n"
			 "and   y is the suit to find (0 = DIAMOND, 1 = CLUBS, 2 = HEARTS, 3 = SPADES, 4 = JOKER_RED, 5 = JOKER_BLACK)\n");
	scanf("%d %d", &Value, &Suit);	
	
	tempCard.SetSuit(Suit);
	tempCard.SetValue(Value);	
	
	cardIndexArray = MainDeck.FindCard(&tempCard);

	char buffer[200];
	tempCard.Card2String(buffer);
	printf("The Card %s is found at: ", buffer);
	
	while(*cardIndexArray != EOA )
	{
		
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");	
}

void seekMainDeckSuit(void){

	int input;
	int* cardIndexArray;

	printf("Which card suit to seek?\n");
	printf("Format: <x> (without the < and >)\n"
			 "Where x is the suit to find (0 = DIAMOND, 1 = CLUBS, 2 = HEARTS, 3 = SPADES, 4 = JOKER_RED, 5 = JOKER_BLACK)\n");
	scanf("%d", &input);	
	
	cardIndexArray = MainDeck.FindCardSuit(input);
	
	printf("Cards with suit %s are found at: ", card_suitString[input]);
	while(*cardIndexArray != EOA )
	{
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");
}

void seekMainDeckColour(void){

	int input;
	int* cardIndexArray;

	printf("Which card colour to seek?\n");
	printf("Format: <x> (without the < and >)\n"
			 "Where x is the value to find (0 = RED, 1 = BLACK)\n");
	scanf("%d", &input);	
	
	cardIndexArray = MainDeck.FindCardColour(input);
	
	printf("Cards with colour %s are found at: ", card_colourString[input]);
	while(*cardIndexArray != EOA )
	{
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");
}

void printMainDeck(void){

	for( int i = 0; i < MainDeck.GetSize(); i++ ){
		Card* tempCard = MainDeck.GetCard(i);
		char buffer[200];
		tempCard->Card2String(buffer);
		printf("Card #%d is: %s\n", i+1, buffer);
	}	
	
}

void RemoveCardfromMainDeck(void){

	int input;

	printf("Which card index to remove?\n");
	scanf("%d", &input);

	char buffer[200];
	Card* tempCard = MainDeck.GetCard(input-1);	
	tempCard->Card2String(buffer);
	printf("Card #%d, %s, has been removed!\n", input, buffer);	
	MainDeck.RemoveCard(input);

}

void GetCardTest(void){

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




