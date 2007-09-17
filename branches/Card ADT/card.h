/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: card.h
 * Last modification : 20/09/06
 * Author: Adrian Gin
 *
 * Description: Card Abstract Data Type.
 *	
 *	All the functions associated with the card_t ADT are
 * implemented in the card.c source file.
 */

#ifndef _CARD_
#define _CARD_


typedef enum {DIAMONDS = 0, CLUBS, HEARTS, SPADES, JOKER_RED, JOKER_BLACK} card_suit;

typedef enum  {JOKER = 0, ACE = 1, JACK = 11, QUEEN, KING} card_value;
typedef enum  {RED = 0, BLACK, ERROR} card_colour;

enum CardStatusCodes { CARD_ERROR = 0, CARD_SUCCESS };

class Card{
	
public:
	Card(int initValue, int initSuit) : value(initValue), suit(initSuit){ }
	virtual ~Card(){ }



/* card_SetValue:
 * 
 * Parameters : card_value : The passed card's face 'value' is set to this value.
 *
 * Returns : Nothing.
 *
 * Purpose: If the value is not valid, then exit with an error.
 *
 */	
	virtual int SetValue(int newValue);
	
/* card_SetSuit:
 * 
 * Parameters : card_suit : The card's 'suit' is set to this value.
 *
 * Returns : Nothing.
 *
 * Purpose: If the suit is not valid, then exit with an error.
 *
 */	
	virtual int SetSuit(int newSuit);

/* card_GetValue:
 * 
 * Parameters : None
 *
 * Returns : The face value of the card.
 *
 * Purpose: Returns the face value of the card
 * (see card.h : card_value definition )
 *
 */
	virtual int GetValue() {return value;}
	
/* card_GetSuit:
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

/* card_GetColour:
 * 
 * Parameters : card: The card whose colour is to be returned.
 *					 
 * Returns : An integer either 'RED' or 'BLACK' depending on the colour of the
 *				 passsed card.
 *
 * Purpose: To return the colour of a card in an integer format.
 */
	virtual int GetColour();


/* card_value2string:
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
	
	
/* card_suit2string:
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


/* card_Card2String:
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


/* card_colour2String:
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
