ABC_STARTC_LIB:sayhello
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void sayhello() {
    printf("Hello, world!\n");
}

int add_two_numbers() {
    srand(time(NULL));
    return rand()+rand();
}

ABC_ENDC_LIB

# and we start writing python code!

# the imports
PRE_CALL_C

# Call the from the shared lib in param 1, this is the shared lib
# that was named above.

# Second parameter is the function name inside that library.
CALL_C(sayhello, sayhello)
CALL_C(sayhello, add_two_numbers)

# The result is currently always stored in a variable called, "result"
print(result)

