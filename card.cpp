/* ENEL428 Assignment #3
 * Card Class
 * Filename: card.cpp
 * Last modification : 13/09/07
 * Author: Adrian Gin
 *
 * Description: Playing Card class
 *	
 *	All the functions associated with the Card class
 * implemented in this source file
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "card.h"


const char* card_valueString[16] = {"JOKER",
		                              "ACE",
		                              "2", "3", "4", "5", 
		                              "6", "7","8", "9", "10",
		                              "JACK",
		                              "QUEEN",
		                              "KING"};
               
const char* card_suitString[7] = {"DIAMONDS",
                                  "CLUBS",
                                  "HEARTS",
                                  "SPADES",
                                  "JOKER_RED",
                                  "JOKER_BLACK"};                  

const char* card_colourString[3] = {"RED",
                                   	"BLACK"};

CardStatusCodes Card::SetValue(int newValue){
	
	if( newValue < JOKER || newValue > KING ){
		ErrorCheck(__FILE__, __LINE__);
		return CARD_ERROR;	
	}
	
	value = newValue;
	return CARD_SUCCESS;
}


CardStatusCodes Card::SetSuit(int newSuit){
	
	if( newSuit < DIAMONDS || newSuit > JOKER_BLACK ){
		ErrorCheck(__FILE__, __LINE__);
		return CARD_ERROR;	
	}
	
	suit = newSuit;
	return CARD_SUCCESS;	
}



card_colour Card::GetColour()
{
   if( ((suit) == DIAMONDS) ||
       ((suit) == HEARTS)   ||
       ((suit) == JOKER_RED) ){
      return RED;
   }
   else{
      return BLACK;
   }  
}

const char* Card::Value2String(){
	if( (value > KING) || (value < JOKER))
	{
		ErrorCheck(__FILE__, __LINE__);
		/* Place Card Error here */
	}	
		
   return card_valueString[value];
}



const char* Card::Suit2String(){
	if( (suit > JOKER_BLACK) || (suit < DIAMONDS) )
	{
		ErrorCheck(__FILE__, __LINE__);
		/* Place Card Error here */
	}	
	
   return card_suitString[suit];
}	

void Card::Card2String(char* buffer){
   /* Place Buffer error check here */
   if( buffer == NULL ){
		ErrorCheck(__FILE__, __LINE__);	
	}
   
   strcpy(buffer, Value2String());
   strcat(buffer, " of ");
   strcat(buffer, Suit2String());
}

const char* Card::Colour2String(){
   return card_colourString[GetColour()];
}


void Card::ErrorCheck(char* file, int line){
	printf("Invalid parameter in %s, Line: %d", file, line);
	/* Could throw an exception */
	exit(0);
}



