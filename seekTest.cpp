void seekMainDeckValue(Deck* seekDeck){

	int input;
	int* cardIndexArray;

	printf("Which card value to seek?\n");
	printf("Format: <x> (without the < and >)\n"
			 "Where x is the value to find (0 = JOKER, 1 = ACE .. 13 = KING)\n");
	scanf("%d", &input);	
	
	cardIndexArray = seekDeck.FindCardValue(input);
	
	printf("Cards with value %s are found at: ", card_valueString[input]);
	while(*cardIndexArray != EOA )
	{
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");
}

void seekMainDeckCard(Deck* seekDeck){
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
	
	cardIndexArray = seekDeck.FindCard(&tempCard);

	char buffer[200];
	tempCard.Card2String(buffer);
	printf("The Card %s is found at: ", buffer);
	
	while(*cardIndexArray != EOA )
	{
		
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");	
}

void seekMainDeckSuit(Deck* seekDeck){

	int input;
	int* cardIndexArray;

	printf("Which card suit to seek?\n");
	printf("Format: <x> (without the < and >)\n"
			 "Where x is the suit to find (0 = DIAMOND, 1 = CLUBS, 2 = HEARTS, 3 = SPADES, 4 = JOKER_RED, 5 = JOKER_BLACK)\n");
	scanf("%d", &input);	
	
	cardIndexArray = seekDeck.FindCardSuit(input);
	
	printf("Cards with suit %s are found at: ", card_suitString[input]);
	while(*cardIndexArray != EOA )
	{
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");
}

void seekMainDeckColour(Deck* seekDeck){

	int input;
	int* cardIndexArray;

	printf("Which card colour to seek?\n");
	printf("Format: <x> (without the < and >)\n"
			 "Where x is the value to find (0 = RED, 1 = BLACK)\n");
	scanf("%d", &input);	
	
	cardIndexArray = seekDeck.FindCardColour(input);
	
	printf("Cards with colour %s are found at: ", card_colourString[input]);
	while(*cardIndexArray != EOA )
	{
		printf("%d, ", *(cardIndexArray++) + 1);
	}
	printf("\n");
}
