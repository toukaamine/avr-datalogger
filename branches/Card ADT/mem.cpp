/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: mem.c
 * Last modification : 19/09/06
 * Author: Adrian Gin
 *
 * Description: Memory Handler and Pointer Validation Functions
 *	
 */

#include <stdlib.h>
#include <stdio.h> 
#include "mem.h"
 
#define MALLOC_FAIL (1)
#define MALLOC_SUCCESS (0)


/* memCheck_malloc:
 * 
 * Parameters : malloc_ptr: The Pointer to be checked.
 *					 file: The __FILE__ macro from the file which calls this function.
 *					 line: The __LINE__ macro from the file which calls this funciton.
 *
 * Returns : 'MALLOC_SUCCESS' if the malloc was successful.
 *
 * Purpose: To check that the passed malloc_ptr was successfully malloced.
 * This function is to be called after every malloc to ensure that the malloc
 * was successful.
 *
 * If it was not successful, the program will exit with an 'Out of Memory'
 * error.
 */
int memCheck_malloc(void* malloc_ptr, char* file, int line)
{
	if(malloc_ptr == NULL)
	{
		printf("Fatal Error!\n<BR>");
		printf("In %s:%d - Memory Allocation failed!", file, line);
		exit(EXIT_FAILURE);	
	}

	return MALLOC_SUCCESS;
}

/* checkValidPointer:
 * 
 * Parameters : ptr: The Pointer to be checked.
 *					 file: The __FILE__ macro from the file which calls this function.
 *					 line: The __LINE__ macro from the file which calls this funciton.
 *
 * Returns : Whether the Pointer exists or not.
 *
 * Purpose: To check whether the passed pointer exists or not.
 * This function is used to ensure that the ADTs functions operate
 * on only valid pointers which have been initialised.
 *
 * A success will return a 0, while if a pointer does not exist, then
 * the program will exit.
 */
int checkValidPointer(void* ptr, char* file, int line)
{
	if(ptr == NULL)
	{
		printf("Fatal Error!\n<BR>");
		printf("In %s:%d - Error invalid pointer!", file, line);
		exit(EXIT_FAILURE);	
	}
	
	return 0;
	
}

/* webexit:
 * 
 * Parameters : error_code: The exiting conditions.
 *
 * Returns : None
 * 
 * Purpose: Provides a common exit point for a web based game.
 */
void web_exit(int error_code)
{
	printf("\n</BODY> </HTML>");
	exit(error_code);
}




