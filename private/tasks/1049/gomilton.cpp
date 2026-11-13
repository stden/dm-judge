#include<stdio.h>
#include<conio.h>
#include<iostream.h>
#include<stdlib.h>
FILE *fin,*fout;
static int count;
static int bestcx,bestcy;
static int record=-1;
static int*arraycol;
static int*arrayrow;
static int firstusel;
struct rebro
{
int exist;
int lenght;
};
int  privedenie(rebro*);
int find(rebro*,int& ,int&);
void recur(rebro*,int,int);
int find(rebro*p,int&x,int&y)
{
  int summapriv=-1;
  for(int i=0;i<count; i++)
   for(int j=0; j<count;j++)
    {
      int  bestinrow=100;
      int  bestincol=100;
      if (p[i*count+j].lenght==0&&arrayrow[i]!=1&&arraycol[j]!=1)
	{
	  for(int k=0;k<count; k++)
	  {
	    if (p[i*count+k].lenght!=-1&&k!=j&&!arraycol[k])
	     {
	      if (p[i*count+k].lenght<bestinrow) bestinrow=p[i*count+k].lenght;
	     }
	    if (p[k*count+j].lenght!=-1&&k!=i&&!arrayrow[k])
	     {
	      if (p[k*count+j].lenght<bestincol) bestincol=p[k*count+j].lenght;
	     }
	   }
	    if(summapriv<bestinrow+bestincol)
	     {
	      y=i;
	      x=j;
	      summapriv=bestinrow+bestincol;
	     }
	 }
    }
  if (summapriv==-1)
    return 0;
    return 1;
}
void recur(rebro*Q,int chislo,int cursumma)
{
  rebro *first=new rebro[count*count];
   rebro *second=new rebro[count*count];
    for(int i=0; i<count*count; i++)
     {
      first[i]=second[i]=Q[i];
     }
int summa1=privedenie(first);
 if ((record==-1||cursumma<record)&&chislo==0)
   {
     record=cursumma;
   }
 else
  {
    int bestx,besty;
    int luck=find(first,bestx,besty);
    if (luck==1)
      {
	arraycol[bestx]=1;
	arrayrow[besty]=1;

       if (chislo!=2)
	{
	  first[besty*count+bestx].exist=1;
	   for(int k=0; k<count; k++)
	    for(int i=0; i<count;i++)
	     for (int j=0; j<count; j++)
	      {
		if (first[i*count+j].exist==0)
		 {
		   first[i*count+j].exist=first[i*count+k].exist*first[k*count+j].exist;
		 }
		  if (first[i*count+j].exist==1)
		 {
		  first[j*count+i].lenght=-1;
		  first[j*count+i].exist=0;
		 }
	      }
	 }
	 int summa2=privedenie(first);
	 if (record==-1||cursumma+summa1+summa2<record)
	  recur(first,chislo-1,cursumma+summa1+summa2);
       arraycol[bestx]=0;
       arrayrow[besty]=0;
      }
  delete [] first;
if (luck==1)
 {
   second[besty*count+bestx].lenght=-1;
   second[besty*count+bestx].exist=0;
    summa1=privedenie(second);
     if (cursumma+summa1<record||record==-1)
      recur(second,chislo,cursumma+summa1);
 }
 delete [] second;
 }
}
int privedenie(rebro* p)
{
 int best[40];
  for(int i=0; i<count; i++)
    {
     best[i]=100;
    }
 int summa=0;
  for(i=0;i<count; i++)
   {
    for(int j=0; j<count; j++)
     {
      if (p[i*count+j].lenght!=-1&&arrayrow[i]!=1&&arraycol[j]!=1)
      if (p[i*count+j].lenght<best[i]) best[i]=p[i*count+j].lenght;
     }
   }
 for (i=0; i<count; i++)
   {
    for (int j=0; j<count; j++)
     {
      if (p[i*count+j].lenght!=-1&&arrayrow[i]!=1&&arraycol[j]!=1)
      p[i*count+j].lenght+=-best[i];
     }
    if (best[i]!=100)
     {
      summa+=best[i];
      best[i]=100;
     }
    }
for(int j=0;j<count; j++)
 for(int i=0; i<count; i++)
   {
     if (p[i*count+j].lenght!=-1&&arrayrow[i]!=1&&arraycol[j]!=1)
     if (p[i*count+j].lenght<best[j])
      best[j]=p[i*count+j].lenght;
   }
 for (j=0; j<count; j++)
   {
    for (int i=0; i<count; i++)
    {
      if (p[i*count+j].lenght!=-1&&arrayrow[i]!=1&&arraycol[j]!=1)
      p[i*count+j].lenght+=-best[j];
    }
     if (best[j]!=100)
     summa+=best[j];
   }
return summa;
}
void main()
{
clrscr();
 fin=fopen("file\\input.txt","r");
 fout=fopen("file\\output.txt","w");
 int repeat;
 fscanf(fin,"%d",&repeat);
 for (int s=0; s<repeat; s++)
 {
  fscanf(fin,"%d",&count);
  arraycol=new int[count];
  arrayrow=new int[count];
  for(int i=0; i<count; i++)
    {
     arraycol[i]=0;
     arrayrow[i]=0;
    }
  rebro * p=new rebro[count*count];
   for(i=0; i<count; i++)
    for(int j=0; j<count; j++)
     {
      fscanf(fin,"%d",&p[i*count+j].lenght);
       if (i==j)
	 p[i*count+j].exist=1;
       else
	 p[i*count+j].exist=0;
     }
recur(p,count,0);
delete [] arraycol;
delete [] arrayrow;
delete [] p;
fprintf(fout,"%d\n",record);
record=-1;
 }
fclose(fin);
fclose(fout);
}