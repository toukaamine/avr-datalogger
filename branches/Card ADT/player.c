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


/* player_make:
 * 
 * Parameters : None
 *
 * Returns : Pointer to the newly created player.
 *
 * Purpose: Makes a new player, and initialises the memory required
 * to make one.
 */
player_t* player_make(void)
{
	player_t* new_player;
	
	/* Allocate space for new_player */
	new_player = malloc( sizeof(player_t) );
	memCheck_malloc(new_player,__FILE__, __LINE__);
	
	/* Allocate space for a name */
	new_player->name = (char*)malloc(sizeof(char)*1);
	memCheck_malloc(new_player->name,__FILE__, __LINE__);
	new_player->name[0] = 0;

	
	/* Allocate space for a deck */
	new_player->deck = deck_make();
	/* Set default player state to PLAYING */
	new_player->state = PLAYING;
	new_player->Csum = 0;
	new_player->CAceSum = 0;
	
	return new_player;
}


/* player_delete:
 * 
 * Parameters : player: The player to be deleted.
 *
 * Returns : Nothing
 *
 * Purpose: To free all the memory associated with the passed player.
 * If the player does not exist, then nothing is deleted.
 *
 * To ensure proper operation, the player passed to player_delete should have 
 * been made using the player_make function.
 */
void player_delete(player_t* player)
{
	checkValidPointer(player,__FILE__, __LINE__);
	checkValidPointer(player->name,__FILE__, __LINE__);	
	free(player->name);
	deck_delete(player->deck);
}

/* player_setName:
 * 
 * Parameters : player: The player whose name is to be set.
 *					 new_name: The name pointer which points to the new name.
 *
 * Returns : Nothing.
 *
 * Purpose: To set the name of the passed player.
 */
void player_setName(player_t* player, char* new_name)
{
	checkValidPointer(new_name,__FILE__, __LINE__);
   checkValidPointer(player,__FILE__, __LINE__);
   		
   /* Allocate space for a name */
	player->name = realloc(player->name, (strlen(new_name)+1) * sizeof(char));
	memCheck_malloc(player->name,__FILE__, __LINE__);
   player->name[0] = 0;		
	strcpy(player->name, new_name);
}

/* player_getName:
 * 
 * Parameters : player: The player whose name is to be returned.
 *
 * Returns : The name of the player.
 *
 * Purpose: To get the name of the passed player.
 * If the player or the name does not exist, then the program will
 * exit with an error
 */
char* player_getName(player_t* player)
{
	checkValidPointer(player,__FILE__, __LINE__);
   checkValidPointer(player->name,__FILE__, __LINE__);
   	
   return player->name;
}


/* player_setState:
 * 
 * Parameters : player: The player whose state is to be set.
 *					 state: The new player's state.
 *
 * Returns : Nothing.
 *
 * Purpose: To set the state of the passed player. EIther playing, standing,
 * busted etc. 
 */
void player_setState(player_t* player, enum player_state new_state)
{
   checkValidPointer(player,__FILE__, __LINE__);
	if( (new_state > LOSER) || (new_state < STANDING) )
	{
		printf("Warning: Player state is set out of range!");
	}	
	player->state = new_state;
}

/* player_setSum:
 * 
 * Parameters : player: The player whose 'score' is to be set.
 *					 sum: The value of the score
 *					 Hand: Either 'NORMAL_HAND' or 'ACE_HAND'
 *
 * Returns : Nothing.
 *
 * Purpose: The player's 'score' can be set accordingly
 * In some games the ace card is worth different values.
 * By passing 'NORMAL_HAND' to 'Hand', the normal sum is set,
 * while passing 'ACE_HAND' to 'Hand' will result in the ACE sum being
 * set.
 */
void player_setSum(player_t* player, int sum, enum HandSelect Hand )
{
	checkValidPointer(player,__FILE__, __LINE__);
   	
   if(Hand == NORMAL_HAND)
   {
   	player->Csum = sum;	
   }
   else
   {
   	player->CAceSum = sum;	
   }
}


/* player_getSum:
 * 
 * Parameters : player: The player whose 'score' is to be fetched
 *					 Hand: Either 'NORMAL_HAND' or 'ACE_HAND'.
 *
 * Returns : The score according to the 'Hand' select flag.
 *
 * Purpose: The player's 'score' can be fetched accordingly
 * In some games the ace card is worth different values.
 * By passing 'NORMAL_HAND' to 'Hand', the normal sum is returned,
 * while passing 'ACE_HAND' to 'Hand' will result in the ACEsum being
 * returned.
 */
int player_getSum(player_t* player, enum HandSelect Hand )
{
	checkValidPointer(player,__FILE__, __LINE__);
   	
   if(Hand == NORMAL_HAND)
   {
   	return player->Csum;
   }
   else
   {
   	return player->CAceSum;
   }
}




/* player_getState:
 * 
 * Parameters : player: The player whose state is to be returned
 *
 * Returns : The player's current state.
 *
 * Purpose: To get the state of the player. Possible player states are defined
 * in player.h, 'player_state'.
 */
int player_getState(player_t* player)
{
   checkValidPointer(player,__FILE__, __LINE__);	
	return player->state;
}




