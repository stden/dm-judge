//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#pragma argsused
#include<conio.h>
#include<stdio.h>

FILE *f,*f2;

void main()
{clrscr();
 f=fopen("C:\\Temp\\battle.txt","r");
 f2=fopen("C:\\Temp\\victory.txt","w");

 long int left,right,size,i,j,k,t,repeat,side,numtests,tmp;
 long int infinity;
 infinity=100000;
 long int end,source,finish,before;
 long int N[2];
 long int *A,*P,*D,*Aside,*Bside;
 fscanf (f,"%D",&numtests);
 for (repeat=0;repeat<numtests;repeat++)//--------------'repeat' loop
 {
 fscanf(f,"%D",&left);
 right=left;
 size=left+right+1;
 Aside=new long int[left];
 Bside=new long int[right];
 for (i=0;i<left;i++)
 {
 fscanf(f,"%D",&Aside[i]);
 fscanf(f,"%D",&Bside[i]);
 }
 A=new long int[size*size];
 for (side=0;side<2;side++)//---------------------------'side' loop
 {
 for (i=0;i<size;i++)
  for (j=0;j<size;j++)
   A[i*size+j]=infinity;
 for (i=left;i<left+right;i++)
  A[i*size+(left+right)]=1;
 for (i=0;i<left;i++)
  {if (Aside[i]>=Bside[i]) A[i*size+(left+i)]=1;
   if (i>0)
    if (Aside[i]>=Bside[i-1]) A[i*size+(left+i-1)]=1;
   if (i<left-1)
    if (Aside[i]>=Bside[i+1]) A[i*size+(left+i+1)]=1;
  }

end=left+right;

D=new long int[size];
P=new long int[size];

N[side]=0;
for (source=0;source<left;source++)//---------------------'source' loop
{
for (i=0;i<size;i++)
 {D[i]=A[size*source+i];
  P[i]=source;}

for (i=0;i<size-2;i++)
 for (j=0;j<size;j++)
  if (j!=source)
   for (k=0;k<size;k++)
    if (k!=source)
     {
     if (D[j]>D[k]+A[size*k+j])
      {
      D[j]=D[k]+A[size*k+j];
      P[j]=k;
      }
     }

finish=end;
before=P[finish];
A[before*size+finish]=infinity;
finish=before;
before=P[finish];
while (finish!=source)
{
if (A[before*size+finish]!=infinity) A[finish*size+before]=1;
A[before*size+finish]=infinity;
finish=before;
before=P[finish];
}
}//------------------------------------------end of 'source' loop
for (i=left;i<left+right;i++)
 for (j=0;j<left;j++)
  if (A[i*size+j]==1) N[side]++;
for (i=0;i<left;i++)
 {
  tmp=Aside[i];
  Aside[i]=Bside[i];
  Bside[i]=tmp;
 }

}//-------------------------------------------end of 'side' loop
if (N[0]>N[1])
 fprintf (f2,"A\n");
else if (N[1]>N[0])
 fprintf (f2,"B\n");
else
 fprintf (f2,"None\n");
delete []A;
delete []P;
delete []D;
delete []Aside;
delete []Bside;

}//-------------------------------------------end of 'repeat' loop
fclose(f);
fclose(f2);
}
