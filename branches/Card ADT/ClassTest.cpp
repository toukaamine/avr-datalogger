/* ENEL428 Assignment #3
 * Card/Deck/Player Class Test Routines
 * Filename: ClassTest.cpp
 * Last modification : 13/09/07
 * Author: Adrian Gin
 *
 * Description: Routines and runtime program to test
 * the class methods and error checking routines.
 *	
 */

#include <stdio.h>
#include "card.h"
#include "deck.h"
#include "Player.h"
#include "seekTest.h"
#include "hand.h"

void CardClassTest(void);
void DeckClassTest(void);
void GetCardTest(Deck* deck2Retrieve);
void RemoveCardfromDeck(Deck* deck2Print);
void printDeck(Deck* deck2Print);

/* Test functions for the Card, Deck and Player class */
/* The deck belonging to a player shall be used to test the
 * deck methods.
 */

int main(int argc, int argv[])
{
	Player MainPlayer;
	Deck* MainDeck;
	
	printf("ENEL428 Card Game Assignment 2007\n"
			 "By Adrian Gin\n\n\n");
	
	MainDeck = (MainPlayer.GetDeck());
	MainDeck->StdFill(HAS_JOKERS);
	MainDeck->Shuffle();	
	
	while(1){
		char input[4];
		printf("Please enter which module to test:\n"
				 "D - Deck Class Test - Tests the creation of a standard deck and shuffles it\n"
				 "C - Card Class Test - Tests the creation of all card types\n"
				 "G - GetCard Method Test - Returns a card from the Player Deck\n"
				 "R - Remove Card Method Test - Removes a card from the Player Deck\n"
				 "P - Print the player's deck\n"
				 "V - Find card with a particular value - in the Player Deck\n"
				 "S - Find card with a particular suit - in the Player Deck\n"
				 "c - Find card with a particular colour - in the Player Deck\n"
				 "F - Find a certain card - in the Player Deck\n"
				 "s - Re-shuffle the player's deck\n");
		scanf("%s", input);
		
		switch(input[0]){
			/* Deck Test Function, Makes a new deck, shuffles it and removes all the cards from it */
			case 'D':
				DeckClassTest();
				break;
			
			/* Tests boundary inputs for Card class */	
			case 'C':
				CardClassTest();
				break;
			
			/* Test the GetCard method of the Deck Class */	
			case 'G':
				GetCardTest(MainDeck);
				break;
			
			/* Prompts the user to remove a card from the player deck */
			case 'R':
				RemoveCardfromDeck(MainDeck);
				break;	
			
			/* Prints the player's deck */	
			case 'P':
				printDeck(MainDeck);
				break;	
			
			/* Seeks a value from the main deck and returns it's index */
			case 'V':
				seekMainDeckValue(MainDeck);
				break;
				
			/* Seeks a suit from the main deck and returns it's index */
			case 'S':
				seekMainDeckSuit(MainDeck);
				break;				
			
			/* Seeks a colour from the main deck and returns it's index */	
			case 'c':
				seekMainDeckColour(MainDeck);
				break;

			/* Seeks a card from the main deck and returns it's index */
			case 'F':
				seekMainDeckCard(MainDeck);
				break;
				
			/* Re-shuffle the player's deck of cards */	
			case 's':		
				MainDeck->Shuffle();
				printDeck(MainDeck);
				printf("Deck Shuffled!\n");
				break;
				
			default:
				break;	
			
		}
	}	
	return 0;	
}


void printDeck(Deck* deck2Print){
	for( int i = 0; i < deck2Print->GetSize(); i++ ){
		Card* tempCard = deck2Print->GetCard(i);
		char buffer[200];
		tempCard->Card2String(buffer);
		printf("Card #%d is: %s\n", i+1, buffer);
	}	
}

void RemoveCardfromDeck(Deck* deck2Print){

	int input;

	printf("Which card index to remove?\n");
	scanf("%d", &input);

	char buffer[200];
	Card* tempCard = deck2Print->GetCard(input-1);	
	tempCard->Card2String(buffer);
	printf("Card #%d, %s, has been removed!\n", input, buffer);	
	deck2Print->RemoveCard(input);

}

void GetCardTest(Deck* deck2Retrieve){

	int input;

	printf("Which card index to retrieve?\n");
	scanf("%d", &input);

	char buffer[200];
	Card* tempCard = deck2Retrieve->GetCard(input-1);	
	tempCard->Card2String(buffer);
	printf("Card #%d, is a %s!\n", input, buffer);	

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

	/* Look at the contents of the deck by removing each one */
	while( TestDeck.GetSize() ){
		char buffer[200];
		TestDeck.GetTopCard()->Card2String(buffer);
		printf("The Top Card is: %s\n", buffer);
		printf("Removing top card...\n");
		TestDeck.RemoveCard(TestDeck.GetSize());
	}	
	
}




