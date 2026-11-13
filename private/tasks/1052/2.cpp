#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>

int min(int x,int y)
{
	if(x<=y) return x;
	return y;
};
int max(int x,int y)
{
	if(x<y) return y;
	return x;
};
typedef char M[10];
class matrix
{
	public:
	M *matr;
	int N;
	int mini,maxi;
	int metka;
	matrix(char*);
	~matrix();
	void floid();
	void poisk();
	void in_file(char*);
};
matrix::matrix(char *name)
{
	FILE *f=fopen(name,"r");
	char c[2];
	c[1]=0;
	metka=0;
	fscanf(f,"%d",&N);
	matr=new M[N*N];
	for(int i=0;i<N*N;i++)
	{
		strcpy(matr[i],"");
		c[0]=getc(f);
		while(c[0]==' '||c[0]=='\n') c[0]=getc(f);
		while(c[0]!='\n'&&c[0]!=' '&&!feof(f))
		{
			strcat(matr[i],c);
			c[0]=getc(f);
		};
	};
	fclose(f);
};
matrix::~matrix()
{
	delete [] matr;
	matr=0;
};
void matrix::floid()
{
	int x,y,z;
	int k1,k2,k3;
	int t,tt;
	for(x=0;x<N;x++)
	{
	    for(y=0;y<N;y++)
		for(z=0;z<N;z++)
		{
			k1=y*N+x;
			k2=x*N+z;
			k3=y*N+z;
			if
			(
			  !strcmp(matr[k1],"no") || !strcmp(matr[k2],"no")
			);
			else
			{
				t=atoi(matr[k1])+atoi(matr[k2]);
				if(!strcmp(matr[k3],"no"))
				{
					strcpy(matr[k3],"");
					itoa(t,matr[k3],10);
				}
				else
				{
					tt=atoi(matr[k3]);
					strcpy(matr[k3],"");
					itoa(min(tt,t),matr[k3],10);
				};
			};
		};
    };
};
void matrix::in_file(char *name)
{
	FILE *f=fopen(name,"w+");
	if(!metka) fputs("no",f);
	else fprintf(f,"%d %d",mini,maxi);
	fclose(f);
};
void matrix::poisk()
{
	int t=0;
	for(int i=0;i<N*N;i++)
		if(strcmp(matr[i],"no"))
			if(!metka)
			{
				mini=maxi=atoi(matr[i]);
				metka=1;
			}
			else
			{
				t=atoi(matr[i]);
				if(mini<t) maxi=max(maxi,t);
				else mini=t;
			};
};
void main()
{
	matrix x("in2.txt");
	x.floid();
	x.poisk();
	x.in_file("out2.txt");
};