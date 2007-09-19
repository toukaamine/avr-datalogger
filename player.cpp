/* ENEL428 Assignment #3
 * Player Class
 * Filename: player.cpp
 * Last modification : 13/09/07
 * Author: Adrian Gin
 *
 * Description: Implemends a Player class for a card game.
 * Player class is to be used with the Deck and Card class.
 *	
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "deck.h"
#include "player.h"
#include "mem.h"


Player::Player(){
	name[0] = 0;
	score = 0;
	state = 0;
}

int Player::SetName(char* newName){
	
	if( strlen(newName) >= MAX_NAME_LENGTH ){
		ErrorCheck(__FILE__, __LINE__);
		return PLAYER_ERROR;
	}
	
	strcpy( name, newName );
	return PLAYER_SUCCESS;
}

int Player::SetScore(int newScore){
	score = newScore;	
	return PLAYER_SUCCESS;	
}

int Player::SetState(int newState){
	
	if( newState < NOT_PLAYING || newState > LOSER ){
		ErrorCheck(__FILE__, __LINE__);	
		return PLAYER_ERROR;	
	}
	
	state = newState;	
	return PLAYER_SUCCESS;	
}

void Player::ErrorCheck(char* file, int line){
	printf("Invalid parameter in %s, Line: %d", file, line);
	/* Could throw an exception */
	exit(0);
}


