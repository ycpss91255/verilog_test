/* 實驗一: LED旋轉測試 */
#include <io.h>     /* 系統I/O函式庫*/
#include <stdio.h>  /* 系統標準輸出入函式庫 */
#include <system.h> /* 系統函式庫 */
#include <unistd.h> /* 宣告 usleep 函數 */
#include <stdint.h> /* 常用數值型態庫 */

void button_func();
void hex_func();

int main() {
  while (1) {
    button_func();
    hex_func();
  }
  return 0;
}

void button_func() {
  int i, j;
  int button;

  button = IORD(BUTTON_BASE, 0);

  if (!((button >> 1) & 0x01)) {
    printf("hello 810440023\n");
    usleep(50000);
  }

  if (!((button >> 2) & 0x1)) {
    for (i = 0; i < 2; i++) {
      for (j = 0; j < 10; j++) {
        IOWR(LED_BASE, 0, 0x01 << j);
        usleep(10000); /* 延遲  us */
      }
    }

    for (i = 0; i < 3; i++) {
      for (j = 0; j < 10; j++) {
        IOWR(LED_BASE, 0, 0x200 >> j);
        usleep(10000); /* 延遲  us */
      }
    }
  }
}

void hex_func(){
  int sw;
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

  sw = IORD(SW_BASE, 0);
  IOWR(HEX0_BASE, 0, ~segments[sw]);
  printf("sw = 0x%x\n", sw);
  // printf("hex = %X\n", segments[sw]);
}
