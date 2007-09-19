/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: player.c
 * Last modification : 20/09/06
 * Author: Adrian Gin
 *
 * Description: Player ADT.
 *	
 * This player ADT is for use with the deck ADT.
 * All functions associated with this player ADT are implemented
 * in this source file.
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


