
#include <stdio.h>
#include "card.h"

int main()
{

	Card* TestCard = new Card(6, 3);

	printf("Clubs = %d", CLUBS);

	Card CardTest(6, DIAMONDS);
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
			
			char buffer[20];
			
			CardTest.Card2String(buffer);
			printf("The card is: %s\n", buffer);

			printf("The card colour is: %s\n", CardTest.Colour2String());			
			
		}
	}


	return 0;	
}





