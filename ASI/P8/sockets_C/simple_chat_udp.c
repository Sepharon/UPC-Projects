#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>

//static char PORT;
//static char *HOST;


void error(const char *msg){
  perror(msg);
  exit(0);
}

int dostuff (int sock){
  struct sockaddr_in si_me, si_other;   
  int n,s,slen = sizeof(si_other);
  char buffer[256];
  bzero(buffer,256);
  n = recvfrom(sock, buffer, 256, 0, (struct sockaddr *) &si_other, &slen);
  //while (n<0) n = recvfrom(sock, buffer, 256, 0, (struct sockaddr *) &si_other, &slen);
  //printf("Received packet from %d:%d\n", inet_ntoa(si_other.sin_addr), ntohs(si_other.sin_port));
  printf("Data: %s" , buffer);

  printf("Please enter the message: ");
  bzero(buffer,256);
  fgets(buffer,255,stdin);

  if (strcmp("exit\n",buffer) == 0) {
    printf("%s\n","Tencant Conexio");
    close(sock);
    return 1;
  }    
  
  sendto(sock, buffer,n, 0, (struct sockaddr*) &si_other, slen);
  return 0;

}
int client(char *argv[]){
  int sockfd, portno, n;
  struct sockaddr_in serv_addr;

  char buffer[256];
 
  portno = atoi(argv[2]);
  sockfd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockfd < 0)  error("ERROR opening socket");
  
  serv_addr.sin_addr.s_addr = inet_addr(argv[1]);
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(portno);

  if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0) 
    error("ERROR connecting");
  while(true){
    printf("Please enter the message: ");
    bzero(buffer,256);
    fgets(buffer,255,stdin);
    
    n = write(sockfd,buffer,strlen(buffer));

    if (strcmp("exit\n",buffer) == 0) {
      printf("%s\n","Tencant Conexio");
      n = write(sockfd,"Closing",8);
      close(sockfd);
      return 0; 
    }    
    if (n < 0) error("ERROR writing to socket");
    bzero(buffer,256);
    n = read(sockfd,buffer,255);
    if (n < 0) error("ERROR reading from socket");
    printf("%s\n",buffer);
    
  }
  close(sockfd);
  return 0;
}

int server(char *argv[]){
	
  int sockfd, newsockfd, portno;
  socklen_t clilen;
  char buffer[256];
  struct sockaddr_in serv_addr, cli_addr;
  int n;

  sockfd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockfd < 0) error("ERROR opening socket");
  bzero((char *) &serv_addr, sizeof(serv_addr));
  portno = atoi(argv[1]);
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
  serv_addr.sin_port = htons(portno);
  if (bind(sockfd, (struct sockaddr *) &serv_addr,
	   sizeof(serv_addr)) < 0) 
    error("ERROR on binding"); 
  if (sockfd < 0) error("ERROR on accept");
  while(true){
    if (dostuff(sockfd) == 1) break;;
  }
  printf("%s\n","out");
  close(sockfd);
  return 0; 
}



int main (int argc, char *argv[]){

  if (argc < 2) printf("%s\n", "No hi han suficient parametres");
  else if (argc == 2){
    //    PORT = argv[2];
    printf("%s %s\n","El port introduit és: ", argv[1]);
    printf("%s\n", "El programa actuara com a servidor");
    server(argv);
  }
  else if (argc == 3){
    printf("%s %s\n","El host al que es conectara sera: ",argv[1]);
    printf("%s %s\n","El port utilitzat serà: ", argv[2]);
    printf("%s\n","El programa actuara com a client");
    client(argv);
    }
  else printf("%s \n","Error");
  return 0;
}

