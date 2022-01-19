#include <stdio.h>
#include <stdlib.h>

/*
unsigned int nwd(unsigned int a, unsigned int b) {
  return b ? nwd(b%a, a) : nwd(a, b%a);
}
*/
int main(int argc, char** argv) {
  unsigned int a, b, c;
  //scanf("%d %d", &a, &b);
  //a = atoi(argv[1]);
  //b = atoi(argv[2]);
  //a = 4;
  //b = 24;
  a = strtol(argv[1], NULL, 10);
  b = strtol(argv[2], NULL, 10);

  print_call_rsp();
  c = nwd(a, b);
  print_ret_rsp();

  printf("%d\n", c);

  return 0;
}
