#define RED "\033[0;31m"
#define clean printf("\033[2J")
#define reset clean; gotoxy(1,1)

void HI(){print("HI there");}

void gotoxy(int x, int y){
  printf("%c[%d;%df", 0x1B, y, x);
  return;
}

void pause(void){
  char*c; 
  c=malloc(10*sizeof(char*));
  scanf("%c",c);
  free(c);
}

void sitelen(char*s){
  return;
  }

void color(int n){
  switch(n){
    case 0: printf("\033[0m"); break; //Original
    case 1: printf("\033[0;31m"); break; //Red
    case 2: printf("\033[0;32m"); break; //Green
    case 3: printf("\033[0;33m"); break; //Yellow
    case 4: printf("\033[0;34m"); break; //Blue
    case 5: printf("\033[0;35m"); break; //Magenta
    case 6: printf("\033[0;36m"); break; //Cyan
    case 10: printf("\033[1;31m"); break; //bRed
    case 20: printf("\033[1;32m"); break; //bGreen
    case 30: printf("\033[1;33m"); break; //bYellow
    case 40: printf("\033[1;34m"); break; //bBlue
    case 50: printf("\033[1;35m"); break; //bMagenta
    case 60: printf("\033[1;36m"); break; //bCyan
    default: printf("\033[2J"); printf("Error."); break;
  }
  return;
}

/*int* gotoxy(int x, int y){
  int*posxy;
  posxy=malloc(2*sizeof(int*));
  if(x<0 && y<0){
    printf("%c[%d;%df", 0x1B, y, x);
  }
  return posxy;
}*/

void swap(int*A, int*B){
  int aux=*A; *A=*B; *B=aux;
}

void putV(int*V, int n){
  printf("\033[2J"); printf("%c[%d;%df",0x1B,1,1);
  for(int i=0;i<n;i++){
    printf("%d",V[i]);
    if(i+1!=n) printf(", ");
  } 
  return;
}

int* getM(int m,int n){
  int*M,i,j; 
  M=malloc(m*n*sizeof(int*));
  for(i=0;i<m;i++){
    for(j=0;j<n;j++){
      clean; gotoxy(1,1);
      printf("Set value to i=%d, j=%d: ",i+1,j+1);
      scanf("%d",(M+i*n+j));
    }
  }
  return M; //This function returns a pointer
}

void putM(int*p, int m, int n){
  int tab,i,j; clean; tab=3;
  for(i=0;i<m;i++){
      for(j=0;j<n;j++){
          gotoxy(j*tab+1,i+1);
          printf("%2d",*(p+i*n+j));
      }
  }
  return;
}