#include <stdio.h>

void main(){
FILE *fin,*fout;
char str[4];
int A[27];
int bufer1,bufer2;
for(int i=1;i<27;i++)
    A[i]=i;
fin=fopen("mlita1in.txt","r");
fout=fopen("mlita1out.txt","w");
while(!feof(fin))
   {
   fgets(str,4,fin);
   if (A[int(str[0])-64]!=A[int(str[1])-64])
           {
           bufer1=A[int(str[0])-64];
           bufer2=A[int(str[1])-64];
                 for (i=1;i<27;i++)
                     if (A[i]==bufer1) A[i]=bufer2;
           fputs(str,fout);
           };
   };
fclose(fin);
fclose(fout);
}