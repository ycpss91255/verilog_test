/* ����@: LED������� */
#include <stdio.h>  /* �t�μзǿ�X�J�禡�w */
#include <system.h> /* �t�Ψ禡�w */
#include <io.h>     /* �t��I/O�禡�w*/
#include <unistd.h> /* �ŧi usleep ��� */

int main(){

    while(1){
		IOWR(LED_BASE, 0, 0x01); /* LED ����  */
		usleep(100000); /* ����  us */

		IOWR(LED_BASE, 0, 0x01 << 2); /* LED ����  */
		usleep(100000); /* ����  us */

		IOWR(LED_BASE, 0, 0x01 << 3); /* LED ����  */
		usleep(100000); /* ����  us */


    return 0;
    }
}
