/* ���剖�頦@: LED���剖�頦���剖�? */
#include <io.h>     /* �楠���背/O��撘�蝺�/
#include <stdio.h>  /* �楠��璅��貉X����撘�蝺�*/
#include <system.h> /* �楠���賢��楨 */
#include <unistd.h> /* ����usleep ���剖�? */
#include <string.h> /* �����剛�渲w */
#include <stdint.h> /* �狗���詨��祈���楨 */
#include <stdbool.h>/* ���剖��文�頦����撘�蝺�*/

void button_func();
void hex_func();

int main() {
  int button, sw;
  printf("hello cyc\n");
  while (1) {
    button = IORD(BUTTON_BASE, 0);
    sw = IORD(SW_BASE, 0);

    button_func(button);
    hex_func(sw);
  }
  return 0;
}

void button_func(int button) {
  int i, j;
  // BUTTON 1
  if (!((button >> 1) & 0x01)) {
    printf("hello 810440023\n");
    usleep(50000);
  }

  // BUTTON 2
  if (!((button >> 2) & 0x1)) {
    /* LED left shift */
    for (i = 0; i < 2; i++) {
      for (j = 0; j < 10; j++) {
        IOWR(LED_BASE, 0, 0x01 << j);
        usleep(10000); /* delay us */
      }
    }
    /* LED right shift */
    for (i = 0; i < 3; i++) {
      for (j = 0; j < 10; j++) {
        IOWR(LED_BASE, 0, 0x200 >> j);
        usleep(10000); /* delay us */
      }
    }
  }
}

void hex_func(int num){
  unsigned char segments[16] = {
      0x3F, // 0 0b0011 1111
      0x06, // 1 0b0000 0110
      0x5B, // 2 0b0101 1011
      0x4F, // 3 0b0100 1111
      0x66, // 4 0b1001 1001
      0x6D, // 5 0b1001 0010
      0x7D, // 6 0b1000 0010
      0x07, // 7 0b1111 1000
      0x7F, // 8 0b1000 0000
      0x6F, // 9 0b1001 0000
      0x77, // A 0b0111 0111
      0xFF, // B.0b1111 1111
      0x39, // C 0b0011 1001
      0xBF, // D.0b1011 1111
      0x79, // E 0b0111 1001
      0x71  // F 0b0111 0001
  };
  num = num & 0x0F;
  IOWR(HEX0_BASE, 0, ~segments[num]);
}
