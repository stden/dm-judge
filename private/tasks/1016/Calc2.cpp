// 2003. LETI Programming Contest. 
// Problem: "Calc"
// Alexander Maximov. Sweden.

#include <fstream.h>
#include <stdio.h>
#include <stdlib.h>

FILE * in =fopen("02.","rb");
FILE * out=fopen("02.aa","wb");
long n=0, val=0, read=0, op='+', t, ch;

void perform_operation(void)
{ if(op=='+') val=(val+read)%n;
		else  // else '^'
		{ t=val;
			val=1;
			while(read)
			{ if(read&1) val=(val*t)%n;
				t=(t*t)%n;
				read>>=1;
			}
		}
	op=ch;
	read=0;
}


void main(void)
{  long tests;
   fscanf(in,"%ld\n",&tests);
   for(long test=0;test<tests;test++){
	n=0, val=0, read=0, op='+';
	fscanf(in,"%ld",&n);
	while((ch=fgetc(in))!=13)
	{ if(ch==EOF) break;
	  if(ch=='+' || ch=='^') perform_operation();
	  if(ch>='0' && ch<='9')
	    if(op=='+') read=(read*10+ch-'0')%n;
	      else read=(read*10+ch-'0')%(n-1);
	}
	perform_operation();
	fprintf(out,"%ld\n",val);
   };
   fclose(in);
   fclose(out);
}

