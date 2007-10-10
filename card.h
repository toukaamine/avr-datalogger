/* ENEL428 Assignment #3
 * Card Class
 * Filename: card.c
 * Last modification : 13/09/07
 * Author: Adrian Gin
 *
 * Description: Playing Card class
 *	
 */


#ifndef _CARD_
#define _CARD_

extern const char* card_valueString[];
extern const char* card_suitString[];
extern const char* card_colourString[];


typedef enum {DIAMONDS = 0, CLUBS, HEARTS, SPADES, JOKER_RED, JOKER_BLACK} card_suit;

typedef enum  {JOKER = 0, ACE = 1, JACK = 11, QUEEN, KING} card_value;
typedef enum  {RED = 0, BLACK, ERROR} card_colour;

typedef enum  { CARD_ERROR = 0, CARD_SUCCESS } CardStatusCodes;

class Card{
	
public:
	Card(int initValue, int initSuit) : value(initValue), suit(initSuit){ }
	virtual ~Card(){ }



/* SetValue:
 * 
 * Parameters : newValue : The card value.
 *
 * Returns : Either CARD_ERROR or CARD_SUCCESS depending on whether
 *  			 the card's value was successfully changed.
 *
 * Purpose: If the value is not valid, then exit with an error.
 *
 */	
	virtual CardStatusCodes SetValue(int newValue);
	
/* SetSuit:
 * 
 * Parameters : suit : The card's 'suit' is set to this value.
 *
 * Returns : Either CARD_ERROR or CARD_SUCCESS depending on whether
 *  			 the card's suit was successfully changed.
 *
 * Purpose: If the suit is not valid, then exit with an error.
 *
 */	
	virtual CardStatusCodes SetSuit(int newSuit);

/* GetValue:
 * 
 * Parameters : None
 *
 * Returns : The face value of the card.
 *
 * Purpose: Returns the face value of the card
 * (see card.h : card_value definition for face cards )
 *
 */
	virtual int GetValue() {return value;}
	
/* GetSuit:
 * 
 * Parameters : None
 *
 * Returns : The suit of the card.
 *
 * Purpose: Returns the suit of the card.
 * (see card.h : card_suit definition )
 *
 */	
	virtual int GetSuit() {return suit;}

/* GetColour:
 * 
 * Parameters : None.
 *					 
 * Returns : An integer either 'RED' or 'BLACK' depending on the colour of the
 *				 passsed card.
 *
 * Purpose: To return the colour of a card in an integer format.
 */
	virtual card_colour GetColour();


/* Value2string:
 * 
 * Parameters : None.
 *					 
 * Returns : The converted card's face value in a C String format.
 *
 * Purpose: Converts the face value of the card to a printable C String.
 * If the card's value is invalid, then the function will exit with an error.
 * 
 */
	virtual const char* Value2String();
	
	
/* Suit2string:
 * 
 * Parameters : None.
 *					 
 * Returns : The converted card's suit in a C String format.
 *
 * Purpose: Converts the suit of the card to a printable C String.
 * If the card's suit is invalid, then the function will exit with an error.
 * 
 */
	virtual const char* Suit2String();


/* Card2String:
 * 
 * Parameters : buffer: The pointer where the C string will be written to.
 *					 
 * Returns : Returns the a string in the format of
 * 			 "value" of "suit", eg. "6 of Clubs"
 *
 * Purpose: To return a C String describing the parameters of the card.
 * The user must ensure that 'buffer' has enough memory for the string to be stored.
 */
	virtual void Card2String(char* buffer);


/* Colour2String:
 * 
 * Parameters : None
 *					 
 * Returns : A C String (either "RED" or "BLACK") depending on the colour of the
 *				 passsed card.
 *
 * Purpose: To return the colour of a card in a C String format.
 */
	virtual const char* Colour2String();

	
	
protected:
	int	value;
	int	suit;	
	virtual void ErrorCheck(char* file, int line);
	
};


#endif
