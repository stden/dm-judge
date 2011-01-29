#include <stdio.h>

unsigned long summa (unsigned long a, unsigned long b)
{
  return a+b;
}

void main()
{
  FILE *fin, *fout;
  int qt;
  unsigned long a, b;
  fin=fopen ("in1000.txt", "r");
  fout=fopen ("out1000.txt", "w");
  fscanf (fin, "%d\n\n", &qt);
  for (int i=0; i<qt; i++)
  {
	fscanf (fin, "%ld %ld", &a, &b);
	fprintf (fout, "%ld\n", summa (a, b));
  }
  fclose (fin);
  fclose (fout);
}

