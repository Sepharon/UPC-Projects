#include "frame.h"

	
uint8_t ta_rx[32];
static block_morse rx_H = ta_rx;

static void pinta(void);

int main(void){
	serial_init();
	sei();
	frame_init();
	numeracio_trama='A';
	waiting_for='0';
	on_frame_recived(pinta);
	serial_put('K');
	serial_put('\r');
	serial_put('\n');
	while(true);
}

static void pinta(void){
	frame_block_get(rx_H);
	print(rx_H);
}