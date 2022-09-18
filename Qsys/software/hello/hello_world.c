/* 實驗一: LED旋轉測試 */
#include <stdio.h>  /* 系統標準輸出入函示庫 */
#include <system.h> /* 系統函示庫 */
#include <io.h>     /* 系統I/O函示庫*/
#include <unistd.h> /* 宣告usleep函數 */

int main()
{
  int i;
  printf("Hello LED test!\n");
  while(1){
      for(i=0;i<9;i++){
          IOWR(LED_BASE, 0, 0x01<<i); /* LED 左移 */
          usleep(100000); /* 延遲 */
      }
  }
  return 0;
}
