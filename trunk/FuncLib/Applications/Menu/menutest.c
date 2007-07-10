#include <stdio.h>
#include "Menu.h"


int main(void)
{
   char haha;
   char hack;
   
   while( 1 )
   {     
      MenuUpdate(); 
      printf("\n");     
      scanf("%c%c", &haha, &hack);
      
      MenuSetInput(haha);

    
      printf("\n");
      
   }
   

   return 0;
   
}
