#include <io.h> 	/* 系統I/O函式庫*/
#include <stdio.h> 	/* 系統標準輸出入函式庫 */
#include <system.h> /* 系統函式庫 */
#include <unistd.h> /* 宣告usleep函數 */
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

void button_func();
int hex_func();

int main() {
  int button, sw, hex_num = 0;
  printf("hello nios II\n");
  while (1) {
    button = IORD(BUTTON_BASE, 3);
    sw = IORD(SW_BASE, 3);
    button_func(button);
    hex_num = hex_func(hex_num, sw, button);
  }
  return 0;
}

void button_func(int button) {
  int i, j;
  // BUTTON 1
  if (button & 0x01) {
    IOWR(BUTTON_BASE, 3, 0);
    printf("hello 810440023\n");
  }

  // BUTTON 2
  if ((button >> 1) & 0x1) {
//  if ((button & 0x2) {
	IOWR(BUTTON_BASE, 3, 0);
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

int hex_func(int num, int sw, int button){
  uint8_t segments[16] = {
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
  if (sw) {
    IOWR(SW_BASE, 3, 0);
    num = (sw & 0x0F) ? (IORD(SW_BASE,0) & 0x0F) : num;
  }
  if (button & 0x01) {
	IOWR(BUTTON_BASE, 3, 0);
	num = (num >= 0x0F) ? 0 : num+1;

  }else if ((button >> 1) & 0x01) {
	IOWR(BUTTON_BASE, 3, 0);
	num = (num == 0x00) ? 0x0F : num-1;
  }
  IOWR(HEX0_BASE, 0, ~segments[num]);

  return num;
}
