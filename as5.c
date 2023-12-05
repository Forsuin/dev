/*
    Ian Laidlaw

    Purpose: Write a C program to read reverse polish notation (RPN) expressions
into an array of strings and use dynamic stack of strings effectively to compute
those RPN expressions. Noter: RPN expressions will NOT contain parentheses. Use
integer arithmetic (eg 5/3 gives 1).


    Input: input from stdin
    Output: The expression converted to RPN
    Algorithm:
        Read in each line of input
        Output line
        Loop over each character
        Either add digit to stack or do math op
        print result
*/

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

/* I really wanted to make a function lookup table for this since it sounded
    cool
*/
typedef int (*Operation)(int, int);

/*
Pair of character (+, -, *, /) and a corresponding function
*/
typedef struct {
  char op;
  Operation func;
} OpPair;

typedef struct Node {
  struct Node *next;
  int data;
  
} Node;

/*
Stack 'object'
*/
typedef struct Stack {
  unsigned int size;
  Node *top;
} Stack;

Stack *createStack(void);
void push(Stack *stack, int data);
/* Don't want to give access to internal representation*/
int top(Stack *stack);
int pop(Stack *stack);

char *inputExpr(void);
void displayInput(char *input);
void evaluatePRN(char *input);

int add(int x, int y);
int subtract(int x, int y);
int multiply(int x, int y);
int divide(int x, int y);

/*
    Characters and corresponding function
*/
OpPair opFuncs[] = {
    {'+', add}, {'-', subtract}, {'*', multiply}, {'/', divide}};

Operation getFunc(char op);

int main(void) {
  char c;
  char **inputLines;

  int i = 0;
  while (scanf("%c", &c) != EOF) {
    ungetc(c, stdin);

    inputLines[i] = inputExpr();

    i++;
  }

  int j = 0;
  for (; inputLines[j] != NULL && j < i; j++) {
    displayInput(inputLines[j]);
    evaluatePRN(inputLines[j]);
    free(inputLines[j]);
  }
}

/*
    Allocate a new string for input
    Input: nothing
    Output: char * - new string that contains contents of stdin line
*/
char *inputExpr(void) {
  /* Make empty string */
  char *line = malloc(20);

  fgets(line, 20, stdin);

  return line;
}

/*
    Outputs a string from given input
    Input: char *input - string to print
    Output: stdout
*/
void displayInput(char *input) {
  printf("Reverse Polish Notation:\n");

  int i = 0;

  for (; input[i] != '\0' && i < 20; i++) {
    printf("%c ", input[i]);
  }

  printf("\n");
}

/*
    Evaluates the result of a line of PRN, the prints that result
    Input: String to evaluate
    Output: stdout
*/
void evaluatePRN(char *input) {
  printf("Result:\n");

  Stack *stack = createStack();

  int i = 0;

  for (; input[i] != '\0' && i < 20; i++) {
    char c = input[i];

    if (isdigit(c)) {
      push(stack, c - '0');
    } else if (isspace(c)) {
      continue;
    } else {
      int y = pop(stack);
      int x = pop(stack);

      Operation func = getFunc(c);

      push(stack, func(x, y));
    }
  }

  printf("%d\n\n", pop(stack));
}

/*
    The following four math functions are all almost identical
    They take in two numbers, x and y, and return the result of x op y
    as an integer

    Input: int x, int y - input numbers to evaluate, x on left of operator,
           y on right
    Output: int - integer result of operation
*/
int add(int x, int y) { return x + y; }

int subtract(int x, int y) { return x - y; }

int multiply(int x, int y) { return x * y; }

int divide(int x, int y) { return x / y; }

/*
    Finds the corresponding function for the input operator character, if
    it exists
    Input: char op - operator character to find function for
    Output: Operation - function pointer that takes in two ints and returns
            an int
*/
Operation getFunc(char op) {
  int i = 0;

  for (; i < 4; i++) {
    if (op == opFuncs[i].op) {
      return opFuncs[i].func;
    }
  }
  printf("Invalid operator\n");
  return NULL;
}

/*
    Creates a new stack
    Input: void
    Output: Stack * - pointer to new stack object
*/
Stack *createStack(void) {
  Stack *stack = malloc(sizeof(Stack));
  stack->size = 0;
  stack->top = NULL;

  return stack;
}

/*
    Adds a new element to the top of a stack
    Input - Stack *stack - stack to add onto
            void *data - data to add to stack
    Output - void
*/
void push(Stack *stack, int data) {
  Node *node = malloc(sizeof(Node));

  node->data = data;
  node->next = stack->top;
  stack->top = node;
  stack->size++;
}

/*
    Returns the element at the top of the stack
    Input - Stack *stack - stack to find top-most data of
    Output - int - number at top of stack
*/
int top(Stack *stack) { return stack->top->data; }

/*
    Same as top, but also removes element from top of stack and decreases top
    Input - Stack *stack - stack to pop element off of
    Output - int - number from top of stack
*/
int pop(Stack *stack) {
  int data = (stack->top->data);

  /* Move stack down and free previous top node */
  Node *temp = stack->top;
  stack->top = temp->next;
  free(temp);

  stack->size--;
  return data;
}