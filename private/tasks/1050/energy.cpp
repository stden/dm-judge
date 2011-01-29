//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#pragma argsused
#include<conio.h>
#include<stdio.h>

FILE *f,*f2;

void main()
{clrscr();
 f=fopen("C:\\Temp\\energy.txt","r");
 f2=fopen("C:\\Temp\\repair.txt","w");

 long int left,right,size,i,j,k,t,repeat,numtests;
 long int infinity;
 infinity=100000;
 long int end,source,finish,before,N;
 long int *A,*P,*D;
 fscanf (f,"%D",&numtests);
 for (repeat=0;repeat<numtests;repeat++)
 {
 fscanf(f,"%D",&left);
 fscanf(f,"%D",&right);
 size=left+right+1;
 A=new long int[size*size];
 for (i=0;i<size;i++)
  for (j=0;j<size;j++)
   A[i*size+j]=infinity;
 for (i=left;i<left+right;i++)
  A[i*size+(left+right)]=1;
 for (i=0;i<left;i++)
  for (j=left;j<left+right;j++)
   {fscanf(f,"%D",&A[size*i+j]);
    if (A[size*i+j]==0) A[size*i+j]=infinity;}

end=left+right;

D=new long int[size];
P=new long int[size];

N=0;
for (source=0;source<left;source++)//-----------------Main loop
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
}

for (i=left;i<left+right;i++)
 for (j=0;j<left;j++)
  if (A[i*size+j]==1) N++;
fprintf (f2,"%d\n",N);
delete []A;
delete []P;
delete []D;

}//end of repeat
fclose(f);
fclose(f2);
}
