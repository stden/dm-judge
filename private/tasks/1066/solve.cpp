#include <conio.h>
#include <stdio.h>
#include <string.h>

  int c=2,i,cm=2;
  char te[256], stack[256], rez[256];
  FILE *in, *out;
void add()
{
  strcpy (&stack[c],&te[i]);
  c++;
  if (c>cm) cm=c;
//  printf ("%d",cm);
}

int vernost()
{  int e2=0, e=1, u=0, ret;
  for (int v=0;v<strlen(te);v++)
	switch (te[v])
	{
	  case '^':
	  case '*':
	  case '/':
	  case '+':
	  case '-':e++; break;
	  case '&': break;
	  case '(':u++; break;
	  case ')':
		//if (te[v-
		u--;
		break;

	  default:
			   e2++; break;
	}
if ((e==e2)&&(u==0))
{ for (v=0;v<strlen(rez);v++)
	if (rez[v]=='(') return 0; else ret=1;
  for (v=0;v<strlen(te);v++)
	switch (te[v])
	 {
	   case '+':
	   case '-':
	   case '*':
	   case '/':
	   case '^':
	   case '&':
	   case '(':
		 switch (te[v+1])
		 {
		   case '+':
		   case '-':
		   case '*':
		   case '/':
		   case '^':
			 return 0;
		  // break;
		 }
		 break;
	   case ')':switch (te[v-1])
		 {
		   case '(':
		   case '+':
		   case '-':
		   case '*':
		   case '/':
		   case '^':
		   case '&': return 0;
		   //break;
		 }
		 break;
	   default: 	 switch (te[v+1])
		 {
		   case '\0':
		   case '(':
		   case ')':
		   case '+':
		   case '-':
		   case '*':
		   case '/':
		   case '^':
		   case '&': break;
			 default: return 0;
		 }

	 }
}
else return 0;
return ret;
}

void main()
{
  unlink ("out.txt");
  in=fopen("in.txt","r");
  while (!feof(in))
  {
  //rez='\0';
  //rez =new char[256];
  fscanf(in,"%s/n",&te[0]);
  //scanf("%s",&te);
  //clrscr();
  for (i=0;i<strlen(te);i++)
  {
	switch (te[i])
	{
	  case '(':
		add();
		break;
	  case '^':
		add();
		for(;c>2;c--)
		  {
			if (stack[c-2]=='&')
			{
			  //printf ("%c",stack[c-2]);
			  //rez= new char;
			  rez[strlen(rez)]=stack[c-2];
			  strcpy (&stack[c-2],&stack[c-1]);
			}
			else break;
		  }

		break;
	  case '*':
	  case '/':
		add();
		for(;c>2;c--)
		  {
			if ((stack[c-2]=='^')||(stack[c-2]=='&'))
			{
			  //printf ("%c",stack[c-2]);
			  //rez=new char;
			  rez[strlen(rez)]=stack[c-2];
			  strcpy (&stack[c-2],&stack[c-1]);
			}
			else break;
		  }
		break;
	  case '+':
	  case '-':
		add();
		for(;c>2;c--)
		  {
			if ((stack[c-2]=='*')||(stack[c-2]=='/')||(stack[c-2]=='^')||(stack[c-2]=='&'))
			{
			  //printf ("%c",stack[c-2]);
			  rez[strlen(rez)]=stack[c-2];
			  strcpy (&stack[c-2],&stack[c-1]);
			}
			else break;
		  }
		break;
	  case ')':
		for (;c>2;c--)
		  {
			//printf ("%c",stack[c-1]);
			rez[strlen(rez)]=stack[c-1];
			if (stack[c-2]=='(') {c-=2; break; }
			//  if (strlen(stack)>cm) cm=strlen(stack);
		  }
		break;
	  case '&':
		add();
		break;

	  default:
			  rez[strlen(rez)]=te[i];
			  //printf ("%c",te[i]);
			   break;
	}

  }
  for (;c>2;c--)
	{
			  //printf ("%c",stack[c-1]);
			  rez[strlen(rez)]=stack[c-1];
	}

	 if (!vernost())
	  { //printf ("HenpaBu/\\bHo\n");
		out=fopen("out.txt","a");
		fprintf (out,"Error!\n");
		fclose (out);
	  }
	 else
	  { //printf  ("%s",rez);
		out=fopen("out.txt","a");
		fprintf (out,"%s\t%d\n",rez,cm-2);
		fclose (out);
	  }
   for (i=0;i<256;i++)
   { rez[i]='\0';
	 te[i]='\0';
	 stack[i]='\0';
   }
   cm=2;
   //delete rez;
  }
  fclose (in);
}