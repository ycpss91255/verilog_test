/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

/* 實驗一: LED旋轉測試 */
#include <stdio.h>  /* 系統標準輸出入函式庫 */
#include <system.h> /* 系統函式庫 */
#include <io.h>     /* 系統I/O函式庫*/
#include <unistd.h> /* 宣告 usleep 函數 */

int main(){
    int i = 0;
    int j = 0;

    printf("Hello LED test!\n");
    while(1){
        for(j = 0; j < 2; j++){
            for(i = 0; i < 10; i++){
                IOWR(LED_BASE, 0, 0x01 << i); /* LED 左移  */
                usleep(100000); /* 延遲  us */
            }
        }
        for(j = 0; j < 3; j++){
            for(i = 0; i < 10; i++){
                IOWR(LED_BASE, 0, 0x200 >> i); /* LED 右移  */
                usleep(100000); /* 延遲 us */
            }
        }
    return 0;
    }
}
