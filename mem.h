/* ENEL323 Assignment #3
 * BlackJack GGI Program
 * Filename: mem.h
 * Last modification : 19/09/06
 * Author: Adrian Gin
 *
 * Description: Memory Handler and Pointer Validation Function headers
 *	
 */
 
 
#ifndef _MEM_H
#define _MEM_H 

#define INVALID_PTR (-1) 

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
int memCheck_malloc(void* malloc_ptr, char* file, int line);



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
int checkValidPointer(void* ptr, char* file, int line);

/* webexit:
 * 
 * Parameters : error_code: The exiting conditions.
 *
 * Returns : None
 * 
 * Purpose: Provides an exit point for a web based game.
 */
void web_exit(int error_code);

#endif


