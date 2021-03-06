#include "checksum.h"

static uint8_t hex_to_byte (numero byte){
  // FUNCIONA
  numero num;
  uint8_t a,b;
  if (byte.a>='0' & byte.a<='9') byte.a-=48;
  else byte.a-=55;
  if (byte.b>='0' & byte.b<='9') byte.b-=48;
  else byte.b-=55;
  a = (byte.a<<4); // 0xB0
  b = byte.b & 0x0F; // 0x09
  a&=0xF0;
  return (a|b);
}

static numero byte_to_hex (uint8_t hex){
  numero num;
  uint8_t a = (hex>>4);
  uint8_t b = hex & 0x0F;
  
  if (a>9 & a<=0x0F) a+=55;
  else a+=48;
  if (b>9 & 0x0F) b+=55;
  else b+=48;
  num.a=a;
  num.b=b;
  return num;
  
}


numero checksum(uint8_t j[]){
  //En la 'a' guardarem la suma
  uint16_t a = 0x00;
  //En la b i ficarem el carry
  uint8_t b,i = 0x00;
  while (j[i] != '\0'){
    a+=j[i];
    i++; 
  }
  
  while (a>0xFF){
    b = (a >> 8);
    a&=0xFF;
    a+=b;
  }
  a=~a;		
  return byte_to_hex(a);
}

bool check_checksum(uint8_t j[]){
  numero num;
  uint8_t a,b,i = 0x00;
  while (j[i] != '\0'){
    i++; 
  }
  num.b=j[--i];
  num.a=j[--i];  
  a=hex_to_byte(num);
  j[i++]=a;
  j[i]='\0';
  i=0;
  num=checksum(j);
  b=hex_to_byte(num);
  
  if (b==0x00) return true;
  else return false;
}

numero crc_morse(uint8_t j[]){
  uint8_t crc,i,aux = 0;
  crc=_crc_ibutton_update(crc,j[i]);
  for(i=1;j[i]!='\0';i++){
    crc=_crc_ibutton_update(crc,j[i]);
    
  }
  return byte_to_hex(crc);
}

bool check_crc(uint8_t j[]){
  numero num;
  uint8_t a,b,i = 0x00;
  while (j[i] != '\0'){
    i++; 
  }
  num.b=j[--i];
  num.a=j[--i];  
  a=hex_to_byte(num);
  j[i++]=a;
  j[i]='\0';
  num=crc_morse(j);
  a=hex_to_byte(num);
  if (a==0x00)  return true;
  else return false;
}
