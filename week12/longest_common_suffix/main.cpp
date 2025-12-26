#include <stdio.h>
#include <string.h>
//Three strings of characters are given. Show the longest common suffix for each of the three pairs of two
//  strings that can be formed. Suggestion: implement longest_common_suffix(const char* first, const char* second) in the ASM Module.

extern "C" int longest_common_suffix(const char* first, const char* second);

int main()
{
	char a[100], b[100], c[100];
	printf("Enter first string: ");
	scanf("%s", a);
	printf("Enter second string: ");
	scanf("%s", b);
	printf("Enter third string: ");
	scanf("%s", c);

	int len_ab = longest_common_suffix(a, b);
	int len_ac = longest_common_suffix(a, c);
	int len_bc = longest_common_suffix(b, c);

	if(len_ab>len_ac && len_ab>len_bc)
	{
		printf("Longest common suffix is between first and second string: ");
		printf("%s", a+strlen(a)-len_ab);
		printf("\n");
	}
	else if(len_ac>len_ab && len_ac>len_bc)
	{
		printf("Longest common suffix is between first and third string: ");
		printf("%s", a+strlen(a)-len_ac);
		printf("\n");
	}
	else
	{
		printf("Longest common suffix is between second and third string: ");
		printf("%s", b+strlen(b)-len_bc);
		printf("\n");
	}


	return 0;
}