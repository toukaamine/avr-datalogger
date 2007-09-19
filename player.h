/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: player.h
 * Last modification : 20/09/06
 * Author: Adrian Gin
 *
 * Description: Player ADT.
 *	
 * This player ADT is for use with the deck ADT.
 * All functions associated with this player ADT are implemented
 * in player.c
 */

#ifndef	_PLAYER_H_
#define  _PLAYER_H_

#include <stdio.h>
#include "deck.h"
/* HOLDING is also known as STANDING in some card games */
#define STANDING	(HOLDING)
enum player_state {NOT_PLAYING = 0, PLAYING, HOLDING, WINNER, LOSER};
typedef enum  { PLAYER_ERROR = 0, PLAYER_SUCCESS } PlayerStatusCodes;

#define MAX_NAME_LENGTH	(50)

class Player{
public:
	Player();
	virtual ~Player(){};

/* player_setName:
 * 
 * Parameters : newName: The name pointer which points to the new name.
 *
 * Returns : Either PLAYER_ERROR or PLAYER_SUCCESS depending on the outcome
 * of the name change.
 *
 * Purpose: To set the name of the player.
 */	
	virtual int SetName(char* newName);
	virtual char* GetName(void){ return name; }
	
	virtual int SetScore(int newScore);
	virtual int GetScore(void){ return score; }

/* SetState:
 * 
 * Parameters : player: The player whose state is to be set.
 *					 state: The new player's state.
 *
 * Returns : Nothing.
 *
 * Purpose: To set the state of the passed player. Either playing, standing/holding,
 * winner, loser etc (see player_state enum). 
 */
	virtual int SetState(int newState);
	virtual int GetState(void){ return state; }
	
/* GetDeck: 
 *	Returns a pointer to the player's deck of cards.
 * The Deck class functions may then be used on the hand.
 */	
	virtual Deck* GetDeck(void){ return &hand; }	
	
protected:
	char name[MAX_NAME_LENGTH];	
	int state;
	int score;
	
	/* The player also has a set of cards,
	 * this is known as the hand */
	Deck	hand;
	
	void ErrorCheck(char* file, int line);
};

 


#endif

