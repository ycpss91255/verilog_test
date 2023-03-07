/* 實驗一: LED旋轉測試 */
#include <stdio.h>  /* 系統標準輸出入函式庫 */
#include <system.h> /* 系統函式庫 */
#include <io.h>     /* 系統I/O函式庫*/
#include <unistd.h> /* 宣告 usleep 函數 */

int main(){

    while(1){
		IOWR(LED_BASE, 0, 0x01); /* LED 左移  */
		usleep(100000); /* 延遲  us */

		IOWR(LED_BASE, 0, 0x01 << 2); /* LED 左移  */
		usleep(100000); /* 延遲  us */

		IOWR(LED_BASE, 0, 0x01 << 3); /* LED 左移  */
		usleep(100000); /* 延遲  us */


    return 0;
    }
}
