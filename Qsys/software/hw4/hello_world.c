#include <io.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <system.h>
#include <unistd.h>

void motor_ctrl(bool motor_num, int duty_num);

int main() {
  int i, sw;
  printf("hello nios II\n");
  while (1) {
    motor_ctrl(0, 255);
    motor_ctrl(1, -64);
  }
  return 0;
}

void motor_ctrl(bool motor_num, int duty_num) {
  if (motor_num) {
    if (duty_num == 0) {
      IOWR(MOTORA_DIR_BASE, 0, 0x03);  // 2'b11
      IOWR(MOTORA_DUTY_BASE, 0, 0);
    } else if (duty_num < 0) {
      IOWR(MOTORA_DIR_BASE, 0, 0x01);  // 2'b01
      IOWR(MOTORA_DUTY_BASE, 0, abs(duty_num));
    } else {
      IOWR(MOTORA_DIR_BASE, 0, 0x02);  // 2'b10
      IOWR(MOTORA_DUTY_BASE, 0, abs(duty_num));
    }
  } else {
    if (duty_num == 0) {
      IOWR(MOTORB_DIR_BASE, 0, 0x03);  // 2'b11
      IOWR(MOTORB_DUTY_BASE, 0, 0);
    } else if (duty_num < 0) {
      IOWR(MOTORB_DIR_BASE, 0, 0x01);  // 2'b01
      IOWR(MOTORB_DUTY_BASE, 0, abs(duty_num));
    } else {
      IOWR(MOTORB_DIR_BASE, 0, 0x02);  // 2'b10
      IOWR(MOTORB_DUTY_BASE, 0, abs(duty_num));
    }
  }
}
