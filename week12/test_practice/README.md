## Test Practice Exercises
For the next problems, at least one subprogram should be implemented in a separated asm module and the main module should be implemented in C.
1. Three strings of characters are given. Show the longest common suffix for each of the three pairs of two strings that can be formed. Suggestion: implement longest_common_suffix(const char* first, const char* second) in the ASM Module.
2. Multiple strings of characters are being read. Determine whether the first appears as a subsequence in each of the others and give an appropriate message. Suggestion: implement is_subsequence(const char* subsequence, const char* target) in the ASM Module.
3. Read from file numbers.txt a string of numbers. Build a string D wich contains the readen numbers doubled and in reverse order that they were read. Display the string on the screen.
Ex: s: 12, 2, 4, 5, 0, 7 => 14, 0, 10, 8, 4, 24. Suggestion: implement reverse_and_double(const int* source, const char* destination) in the ASM Module.
4. Read from the console a list of numbers in base 10. Write to the console only the prime numbers. Suggestion: implement boolean is_prime(int number) in the ASM Module.
5. Read a string of signed numbers in base 10 from keyboard. Determine the minimum value of the string and write it in the file min.txt (it will be created) in 16 base. Suggestion: implement int minimum_from_array(int* array) in the ASM Module.
6. Read a sentence from the keyboard. For each word, obtain a new one by taking the letters in reverse order and print each new word. 



