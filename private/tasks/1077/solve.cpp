#include <stdio.h>
#include <math.h>
#include <string.h>

struct stack
{
  float x;
  stack *next;
};

void main()
{
   FILE *fin, *fout;
   char c[256];
   int i, j, n, qs, qt;
   float *a;
   stack *top=0, *p;
   fin=fopen ("postfix1.in", "r");
   fout=fopen ("postfix1.out", "w");
   fscanf (fin, "%d", &qt);
   for (i=0; i<qt; i++)
   {
	 fscanf (fin, "%d", &n);
	 a=new float [n];
	 for (j=0; j<n; j++)
	   fscanf (fin, "%f", &a[j]);
	 fscanf (fin, "%s", &c);
	 for (j=0; j<strlen(c); j++)
	 {
	   if ((int(c[j])>=97) && (int(c[j])<=122))
	   {
		   p=new stack;
		   p->x=a[int(c[j])-97];
		   p->next=top;
		   top=p;
	   }
	   if (c[j]=='+')
	   {
		 top->next->x=(top->next->x)+(top->x);
		 p=top;
		 top=top->next;
		 delete p;
		 p=top;
	   }
	   if (c[j]=='-')
	   {
		 top->next->x=(top->next->x)-(top->x);
		 p=top;
		 top=top->next;
		 delete p;
		 p=top;
	   }
	   if (c[j]=='*')
	   {
		 top->next->x=(top->next->x)*(top->x);
		 p=top;
		 top=top->next;
		 delete p;
		 p=top;
	   }
	   if (c[j]=='/')
	   {
		 top->next->x=(top->next->x)/(top->x);
		 p=top;
		 top=top->next;
		 delete p;
		 p=top;
	   }
	   if (c[j]=='Q') top->x=sqrt(top->x);
	   if (c[j]=='S') top->x=sin(top->x);
	   if (c[j]=='C') top->x=cos(top->x);
	   if (c[j]=='T') top->x=tan(top->x);
	 }
	 fprintf (fout, "%.4f\n", top->x);
	 delete top;
	 delete a;
   }
   fclose (fin);
   fclose (fout);
}