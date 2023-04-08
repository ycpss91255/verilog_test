#include <io.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <system.h>
#include <unistd.h>

int main() {
  int i;
  printf("hello nios II\n");
  while (1) {
    for (i = 0; i < 8; i++) {
      IOWR(DUTY_NUM_BASE, 0, i);
      printf("duty_num = %d\n", i);
      usleep(1000000);
    }
  }
  return 0;
}
