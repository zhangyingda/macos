/*
** Extract whitespace-delimited tokens from a character array and
** print them one per line.
*/
#include <stdio.h>
#include <string.h>

void
print_tokens( char *line )
{
	char	whitespace[] = "p";
	char	*token;

	for( token = strtok( line, whitespace );
	    token != NULL;
	    token = strtok( NULL, whitespace ) )
		printf( "Next token is %s \n", token );
}
main()
{
   char a[20];
   scanf("%s",&a);
   printf("Current nUm First %s","12222");
   printf("Current Num is %sd",a);
   print_tokens(a);
   
	}
