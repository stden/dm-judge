#include <stdio.h>

void maxarray(FILE *fout, int *array, int n)
{
  long max=0, sum=0;
  int ma=0, mb=0;
  sum=array[0];
  for (int a=0; a<n*n; a++)
  {
	for (int b=a; b<n*n; b++)
	{
	  for (int c=a; c<=b; c++)
		sum+=array[c];
	  if (sum>max)
	  {
		max=sum;
		ma=a;
		mb=b;
	  }
	  sum=0;
	}
	printf ("%d\n", a);
  }
  for (int d=ma; d<=mb; d++)
  {
	fprintf (fout, "%d ", array[d]);
	if (((d+1)%n==0) && ((d+1)!=n*n)) fprintf (fout, "\n");
  }
  fprintf (fout, "\n");
}

void main()
{
  FILE *fin, *fout;
  int qt, *array, n;
  fin=fopen ("in1001.txt", "r");
  fout=fopen ("out1001.txt", "w");
  fscanf (fin, "%d\n\n", &qt);
  for (int k=0; k<qt; k++)
  {
	fscanf (fin, "\n%d\n", &n);
	array= new int [n*n];
	for (int i=0; i<n; i++)
	  for (int j=0; j<n; j++)
		fscanf (fin, "%d ", &array[i*n+j]);
	maxarray (fout, array, n);
	fprintf (fout, "\n");
	delete array;
  }
  fclose (fin);
  fclose (fout);
}